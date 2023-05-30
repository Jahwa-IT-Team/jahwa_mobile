import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  bool _isButtonDisabled = true;

  var photo = 'Common/Image/pics.gif';
  var company = 'Company';
  var department = 'Department';
  var _name = 'Name';
  var position = 'Position';

  var birthday = 'Birthday';
  var mobilephone = 'Mobile Phone';
  var officephone = 'Office Phone';
  var enterdate = 'Enter Data';
  var email = 'Email';

  TextEditingController textController = new TextEditingController();
  FocusNode textFocusNode = FocusNode();

  List<Widget> empList = [];
  Widget emp = new InkWell();

  void initState() {
    super.initState();
    currentIndex = 2;

    if(session['Email'].toString() == '') _isButtonDisabled = true;
    else _isButtonDisabled = false;

    () async {
      await setWorkmate(context, session['EmpCode'].toString());
      setState(() {
        // Update your UI with the desired changes.
      });
    } ();
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
        title: Row(
          children: <Widget>[
            Icon(Icons.search, size: 20, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Search.Search'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body:Container(
        child: SingleChildScrollView( // this will make your body scrollable
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.contact_emergency, size: 20, color: const Color(0xFF729ee2)),
                                  SizedBox(width: 10),
                                  Text('Search.Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 125,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network('https://gw.jahwa.co.kr/' + '$photo'),
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
                                                    Icon(Icons.business, size: 18, color: const Color(0xFF729ee2)),
                                                    SizedBox(width: 10),
                                                    Text('$company', style: TextStyle(fontSize: sSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.hub, size: 18, color: const Color(0xFF729ee2)),
                                                    SizedBox(width: 10),
                                                    Text('$department', style: TextStyle(fontSize: sSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.portrait, size: 18, color: const Color(0xFF729ee2)),
                                                    SizedBox(width: 10),
                                                    Text('$_name', style: TextStyle(fontSize: sSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.spoke, size: 18, color: const Color(0xFF729ee2)),
                                                    SizedBox(width: 10),
                                                    Text('$position', style: TextStyle(fontSize: sSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 49,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.work_history, size: 18, color: const Color(0xFF729ee2)),
                                                      SizedBox(width: 10),
                                                      Text('$enterdate', style: TextStyle(fontSize: sSize, color: Colors.black)),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.stay_current_portrait, size: 18, color: const Color(0xFF729ee2)),
                                                      SizedBox(width: 10),
                                                      Text('$mobilephone', style: TextStyle(fontSize: sSize, color: Colors.black)),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.alternate_email, size: 18, color: const Color(0xFF729ee2)),
                                                      SizedBox(width: 10),
                                                      Text('$email', style: TextStyle(fontSize: sSize, color: Colors.black)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2, // 60%
                                            child: Container(color: Colors.green),
                                          ),
                                          Expanded(
                                            flex: 49, // 20%
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.cake, size: 18, color: const Color(0xFF729ee2)),
                                                      SizedBox(width: 10),
                                                      Text('$birthday', style: TextStyle(fontSize: sSize, color: Colors.black)),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.phone, size: 18, color: const Color(0xFF729ee2)),
                                                      SizedBox(width: 10),
                                                      Text('$officephone', style: TextStyle(fontSize: sSize, color: Colors.black)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            flex: 80,
                                            child: TextField(
                                              autofocus: false,
                                              controller: textController,
                                              focusNode: textFocusNode,
                                              keyboardType: TextInputType.text,
                                              onSubmitted: (String inputText) async {
                                                await findWorkmate(context, textController);
                                              },
                                              style: TextStyle(fontSize: mSize, height: 2.0, color: Colors.black),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(const Radius.circular(5.0),),
                                                  borderSide: new BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                contentPadding: EdgeInsets.only(left:10, right:10, top:5, bottom:5,),
                                                isDense: true,
                                              ),
                                              textInputAction: TextInputAction.next,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            child: SizedBox(),
                                          ),
                                          Flexible(
                                            flex: 18,
                                            child: Container(
                                              alignment: Alignment.topCenter,
                                              child: ButtonTheme(
                                                child: ElevatedButton(
                                                  child:Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.search, size: 20),
                                                    ],
                                                  ),
                                                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                                                  onPressed: _isButtonDisabled ? null : () async {
                                                    await findWorkmate(context, textController);
                                                  },
                                                ),
                                              ),
                                            ),

                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey, thickness: 1,
                                      ),
                                      for(var emp in empList ) emp
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
            backgroundColor: Colors.green,
            onPressed: () { Navigator.pushNamed(context, '/SalaryInformation'); },
            child: Icon(Icons.star, size: 25, color: Colors.white,),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: setBottomNavigator(context),
    );
  }

  /// Get DB Data
  Future<void> findWorkmate(BuildContext context, TextEditingController textController) async {

    if(session['Email'].toString() == '') {
      showMessageBox(context, 'Message.Alert'.tr(), 'Message.If you do not have permission, only your own information is retrieved'.tr());
      return;
    }

    if(textController.text.isEmpty) {
      showMessageBox(context, 'Message.Alert'.tr(), 'Message.Search Text Not Exists !!!'.tr());
      return;
    }

    empList.clear();

    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: true,
      progressBgColor: Colors.transparent,
      msg: "Search Workmate...",
      hideValue: true,
    );

    var url = 'https://jhapi.jahwa.co.kr/MFindWorkmate';
    var data = {'Name': textController.text, 'EmpCode': session['EmpCode'].toString(), 'Email': session['Email'].toString()};

    try {

      await http.post(Uri.parse(url), body: json.encode(data),
          headers: {"Content-Type": "application/json"}).timeout(
          const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") { pd.close(); }
        else if (response.statusCode == 200) {
          if (jsonDecode(response.body)['Table'].length != 0) {
            jsonDecode(response.body)['Table'].forEach((element) {
              emp = InkWell(
                onTap: () async {
                    await setWorkmate(context, element['EmpCode'].toString());
                  }, // Handle your callback
                child: Container(
                  height: 25,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person, size: 18, color: const Color(0xFF729ee2)),
                      SizedBox(width: 10),
                      Flexible(child: Text(element['DName'].toString() + ' ' + element['Position'].toString() + ' [ ' + element['ShortName'].toString() + ' - ' + element['DeptName'].toString() + ' ]', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                    ],
                  ),
                ),
              );

              empList.add(emp);
            });
          }
        }
      });
    } catch (e) {
      print("set Information Error : " + e.toString());
      pd.close();
    }

    textFocusNode.unfocus();
    setState(() {
      pd.close();
    });
  }

  /// Get DB Data
  Future<void> setWorkmate(BuildContext context, String empcode) async {

    var url = 'https://jhapi.jahwa.co.kr/MPersonInformation';
    var data = {'EmpCode': empcode};

    try {

      photo = 'Common/Image/pics.gif';

      company = '';
      department = '';
      _name = '';
      position = '';

      birthday = '';
      mobilephone = '';
      officephone = '';
      enterdate = '';
      email = '';

      await http.post(Uri.parse(url), body: json.encode(data),
          headers: {"Content-Type": "application/json"}).timeout(
          const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") {
          ;
        }
        else if (response.statusCode == 200) {
          setState(() {
            if (jsonDecode(response.body)['Table2'].length != 0) {
              jsonDecode(response.body)['Table2'].forEach((element) { photo = 'Photo/' + element['Photo'].toString(); });
            }

            if (jsonDecode(response.body)['Table'].length != 0) {
              jsonDecode(response.body)['Table'].forEach((element) {
                company = element['EntName'].toString();
                department = element['DeptName'].toString();
                _name = element['Name'].toString();
                position = element['Position'].toString();

                birthday = element['BirthDate'].toString();
                mobilephone = element['Mobile'].toString();
                officephone = element['OfficeTel'].toString();
                enterdate = element['EntrDate'].toString();
                email = element['Email'].toString();
              });
            }
          });
        }
      });
    } catch (e) {
      print("set Information Error : " + e.toString());
    }
  }
}