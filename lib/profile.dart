import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jahwa_mobile/common/bubble_bottom_bar.dart';
import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var jsondata = '';

  void initState() {
    _getInformation();
    super.initState();
    currentIndex = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb9d2ff),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 45,
        backgroundColor: const Color(0xFF729ee2),
        elevation: 0.0,
        title:Row(
          children: <Widget> [
            Icon(FontAwesomeIcons.solidUser, size: bSize, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Profile', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body: Container(
        child : SingleChildScrollView ( // this will make your body scrollable
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.circleInfo, size: bSize,
                                        color: const Color(0xFF729ee2)),
                                    SizedBox(width: 10),
                                    Text('Basic Information'.tr(), style: TextStyle(
                                        fontSize: bSize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54)),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        _setInformation(jsondata),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                  ),
                                ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                  ),
                Container(padding: EdgeInsets.all(50.0),),
                Text('Personal Information', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black38)),
                Text('Change Language', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black38)),
                Text('Additional Information', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black38)),
                TextButton(
                  child: Text('Select Additional Information'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14,)),
                  onPressed: () async {
                    await showAdditionalBox(context);
                  },
                ),
                TextButton(
                  child: Text('Restore Original Information'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14,)),
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();

                    /// Cookie 대용
                    await setUser(context, (prefs.getString('OrgEntCode') ?? ''), (prefs.getString('OrgDeptCode') ?? ''), (prefs.getString('OrgEmpCode') ?? ''), (prefs.getString('OrgEmpCode') ?? ''), (prefs.getString('Token') ?? ''));
                  },
                ),
                TextButton(
                  child: Text('Open Popup'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14,)),
                  onPressed: () {
                    showDialogWithFields(context);
                  },
                ),
                Text('Password Reset', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black38)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 45.0,
        width: 45.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () { Navigator.pushNamed(context, '/Favorite'); },
            child: Icon(FontAwesomeIcons.solidStar, size: 15, color: const Color(0xFFC8DEFF),),
            backgroundColor: Colors.green,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: setBottomNavigator(context),
    );
  }

  /// Login Check Process
  _getInformation() async {
    var empcode = session['EmpCode'].toString();

    try {

      var url = 'https://jhapi.jahwa.co.kr/MPersonInformation';  /// API Url
      var data = {'EmpCode': empcode}; /// Send Parameter

      await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
        if(response.statusCode != 200 || response.body == null || response.body == "{}" ) {
          ;
        }
        if(response.statusCode == 200){
          jsondata = response.body.toString();
          //_setInformation(jsondata);
        }
        else {
          ;
        }
      });

    } catch (e) {
      print("set Information Error : " + e.toString());
    }
  }

  Widget _setInformation(String jsondata) {
    Widget widget = new Row();
    var photo = 'Common/Image/pics.gif';
    if(jsondata != '') {
      if (jsonDecode(jsondata)['Table2'].length != 0) {
        jsonDecode(jsondata)['Table2'].forEach((element) {
          photo = 'Photo/' + element['Photo'].toString();
        });
      }

      if (jsonDecode(jsondata)['Table'].length != 0) {
        jsonDecode(jsondata)['Table'].forEach((element) {
          widget = Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 100,
                height: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      'https://gw.jahwa.co.kr/' + photo),
                ),
              ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.building, size: bSize,
                            color: const Color(0xFF729ee2)),
                        SizedBox(width: 10),
                        Text(element['EntName'].toString(),
                            style: TextStyle(fontSize: sSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.networkWired,
                            size: bSize,
                            color: const Color(0xFF729ee2)),
                        SizedBox(width: 10),
                        Text(element['DeptName'].toString(),
                            style: TextStyle(fontSize: sSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.idCard, size: bSize,
                            color: const Color(0xFF729ee2)),
                        SizedBox(width: 10),
                        Text(element['Name'].toString(),
                            style: TextStyle(fontSize: sSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.sitemap, size: bSize,
                            color: const Color(0xFF729ee2)),
                        SizedBox(width: 10),
                        Text(element['Position'].toString(),
                            style: TextStyle(fontSize: sSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
      }
      else {
        return const Center(child: Text('No data found'),);
      }
    }
    else {
      widget = Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 125,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  'https://gw.jahwa.co.kr/' + photo),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.building, size: bSize,
                        color: const Color(0xFF729ee2)),
                    SizedBox(width: 10),
                    Text('Company'.tr(),
                        style: TextStyle(fontSize: sSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.networkWired,
                        size: bSize,
                        color: const Color(0xFF729ee2)),
                    SizedBox(width: 10),
                    Text('Department'.tr(),
                        style: TextStyle(fontSize: sSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.idCard, size: bSize,
                        color: const Color(0xFF729ee2)),
                    SizedBox(width: 10),
                    Text('Name'.tr(),
                        style: TextStyle(fontSize: sSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.sitemap, size: bSize,
                        color: const Color(0xFF729ee2)),
                    SizedBox(width: 10),
                    Text('Position'.tr(),
                        style: TextStyle(fontSize: sSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    return widget;
  }


}
