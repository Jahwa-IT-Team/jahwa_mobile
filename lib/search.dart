import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jahwa_mobile/common/bubble_bottom_bar.dart';
import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController textController = new TextEditingController();
  FocusNode textFocusNode = FocusNode();

  List<Widget> empList = [];
  Widget emp = new InkWell();

  void initState() {
    super.initState();
    currentIndex = 2;
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
            Icon(FontAwesomeIcons.search, size: bSize, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Search', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body:

      FutureBuilder(
          future: getDBData('MPersonInformation'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            var photo = 'Common/Image/pics.gif';
            var company = 'Company'.tr();
            var department = 'Department'.tr();
            var name = 'Name'.tr();
            var position = 'Position'.tr();

            var birthday = 'Birthday'.tr();
            var mobilephone = 'Mobile Phone'.tr();
            var officephone = 'Office Phone'.tr();
            var enterdate = 'Enter Data'.tr();
            var email = 'Email'.tr();

            String string = '';

            if (snapshot.hasData == false) {
              return Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                    ]
                ),
              );
            }
            else if (snapshot.hasError) {
              return Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Error: ${snapshot.error}', style: TextStyle(fontSize: 15),)
                    ]
                ),
              );
            }
            else {
              if (snapshot.data != '') {
                if (jsonDecode(snapshot.data)['Table2'].length != 0) {
                  jsonDecode(snapshot.data)['Table2'].forEach((element) { photo = 'Photo/' + element['Photo'].toString(); });
                }

                if (jsonDecode(snapshot.data)['Table'].length != 0) {
                  jsonDecode(snapshot.data)['Table'].forEach((element) {
                    company = element['EntName'].toString();
                    department = element['DeptName'].toString();
                    name = element['Name'].toString();
                    position = element['Position'].toString();

                    birthday = element['BirthDate'].toString();
                    mobilephone = element['Mobile'].toString();
                    officephone = element['OfficeTel'].toString();
                    enterdate = element['EntrDate'].toString();
                    email = element['Email'].toString();
                  });
                }
                else { /// No Data
                  ;
                }
              }
              else { /// jsondata == ''
                ;
              }

              return Container(
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
                                          Icon(FontAwesomeIcons.solidAddressCard, size: bSize, color: const Color(0xFF729ee2)),
                                          SizedBox(width: 10),
                                          Text('Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
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
                                                      child: Image.network('https://gw.jahwa.co.kr/' + photo),
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
                                                            Icon(FontAwesomeIcons.building, size: bSize, color: const Color(0xFF729ee2)),
                                                            SizedBox(width: 10),
                                                            Text(company, style: TextStyle(fontSize: sSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Container(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(FontAwesomeIcons.networkWired, size: bSize, color: const Color(0xFF729ee2)),
                                                            SizedBox(width: 10),
                                                            Text(department, style: TextStyle(fontSize: sSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Container(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(FontAwesomeIcons.idCard, size: bSize, color: const Color(0xFF729ee2)),
                                                            SizedBox(width: 10),
                                                            Text(name, style: TextStyle(fontSize: sSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Container(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(FontAwesomeIcons.sitemap, size: bSize, color: const Color(0xFF729ee2)),
                                                            SizedBox(width: 10),
                                                            Text(position, style: TextStyle(fontSize: sSize, fontWeight: FontWeight.bold, color: Colors.black)),
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
                                                              Icon(FontAwesomeIcons.solidBuilding, size: bSize, color: const Color(0xFF729ee2)),
                                                              SizedBox(width: 10),
                                                              Text(enterdate, style: TextStyle(fontSize: sSize, color: Colors.black)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Container(
                                                          child: Row(
                                                            children: <Widget>[
                                                              Icon(FontAwesomeIcons.mobileScreen, size: bSize, color: const Color(0xFF729ee2)),
                                                              SizedBox(width: 10),
                                                              Text(mobilephone, style: TextStyle(fontSize: sSize, color: Colors.black)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Container(
                                                          child: Row(
                                                            children: <Widget>[
                                                              Icon(FontAwesomeIcons.at, size: bSize, color: const Color(0xFF729ee2)),
                                                              SizedBox(width: 10),
                                                              Text(email, style: TextStyle(fontSize: sSize, color: Colors.black)),
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
                                                              Icon(FontAwesomeIcons.birthdayCake, size: bSize, color: const Color(0xFF729ee2)),
                                                              SizedBox(width: 10),
                                                              Text(birthday, style: TextStyle(fontSize: sSize, color: Colors.black)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Container(
                                                          child: Row(
                                                            children: <Widget>[
                                                              Icon(FontAwesomeIcons.phone, size: bSize, color: const Color(0xFF729ee2)),
                                                              SizedBox(width: 10),
                                                              Text(officephone, style: TextStyle(fontSize: sSize, color: Colors.black)),
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
                                                      child: Container( /// Login Button
                                                        alignment: Alignment.topCenter,
                                                        child: ButtonTheme(
                                                          child: ElevatedButton(
                                                            child:Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(FontAwesomeIcons.search, size: 16),
                                                              ],
                                                            ),
                                                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                                                            onPressed: () async {
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
              );
            }
          }
      ),
      floatingActionButton: Container(
        height: 45.0,
        width: 45.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Favorite');
            },
            child: Icon(FontAwesomeIcons.solidStar, size: 15, color: const Color(0xFFC8DEFF),),
            backgroundColor: Colors.green,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: setBottomNavigator(context),
    );
  }

  /// Get DB Data
  Future<void> findWorkmate(BuildContext context, TextEditingController textController) async {

    if(textController.text.isEmpty) { showMessageBox(context, 'Alert', 'Search Text Not Exists !!!'); }

    empList.clear();

    var jsondata = '';
    var url = 'https://jhapi.jahwa.co.kr/MFindWorkmate';
    var data = {'Name': textController.text, 'EmpCode': session['EmpCode'].toString()};

    try {

      await http.post(Uri.parse(url), body: json.encode(data),
          headers: {"Content-Type": "application/json"}).timeout(
          const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == null || response.body == "{}") { ; }
        else if (response.statusCode == 200) {
          if (jsonDecode(response.body)['Table'].length != 0) {
            jsonDecode(response.body)['Table'].forEach((element) {
              emp = Container(
                  height: 25,
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.solidUser, size: sSize, color: const Color(0xFF729ee2)),
                      SizedBox(width: 10),
                      Flexible(child: Text(element['DName'].toString() + ' ' + element['Position'].toString() + ' [ ' + element['ShortName'].toString() + ' - ' + element['DeptName'].toString() + ' ]', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                    ],
                  )
              );

              empList.add(emp);
            });
          }
        }
      });
    } catch (e) {
      print("set Information Error : " + e.toString());
    }

    textFocusNode.unfocus();
    setState(() {
      ;
    });
  }
}