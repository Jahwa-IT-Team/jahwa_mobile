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

  void initState() {
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
        title: Row(
          children: <Widget>[
            Icon(FontAwesomeIcons.solidUser, size: bSize,
                color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Profile', style: TextStyle(fontSize: bSize,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
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

            List<Widget> additionalList = [];
            Widget additional = new Container();
            List<Widget> vehicleList = [];
            Widget vehicle = new Container();
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

                if (jsonDecode(snapshot.data)['Table1'].length != 0) {
                  jsonDecode(snapshot.data)['Table1'].forEach((element) {
                    string = element['EntName'].toString() + ' - ' + element['DeptName'].toString() + ' - ' + element['Title'].toString();
                    if(element['Div'].toString() == 'Dispatch') {
                      additional = Container(
                          height: 25,
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.solidUser, size: sSize, color: const Color(0xFF729ee2)),
                              SizedBox(width: 10),
                              Flexible(child: Text(string, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                            ],
                          )
                      );
                    }
                    else {
                      additional = Container(
                          height: 25,
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.userPlus, size: sSize, color: const Color(0xFF729ee2)),
                              SizedBox(width: 10),
                              Flexible(child: Text(string, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                            ],
                          )
                      );
                    }
                    additionalList.add(additional);
                  });
                }
                else { /// No Data
                  ;
                }

                if (jsonDecode(snapshot.data)['Table4'].length != 0) {
                  jsonDecode(snapshot.data)['Table4'].forEach((element) {
                    string = element['CarNo'].toString() + ' - ' + element['CarModel'].toString() +  ' [' + element['UseYn'].toString() + ']';
                    vehicle = Container(
                        height: 25,
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.car, size: sSize, color: const Color(0xFF729ee2)),
                            SizedBox(width: 10),
                            Flexible(child: Text(string, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                          ],
                        )
                    );
                    vehicleList.add(vehicle);
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
                                          Text('Basic Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
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
                                          Icon(FontAwesomeIcons.addressCard, size: bSize, color: const Color(0xFF729ee2)),
                                          SizedBox(width: 10),
                                          Text('Other Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
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
                                          Icon(FontAwesomeIcons.users, size: bSize, color: const Color(0xFF729ee2)),
                                          SizedBox(width: 10),
                                          Text('Dispatch & Additional Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              for(var additional in additionalList ) additional
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
                                          Icon(FontAwesomeIcons.car, size: bSize, color: const Color(0xFF729ee2)),
                                          SizedBox(width: 10),
                                          Text('Vehicle Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              for(var vehicle in vehicleList ) vehicle
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
                                          Icon(FontAwesomeIcons.tools, size: bSize, color: const Color(0xFF729ee2)),
                                          SizedBox(width: 10),
                                          Text('Utility'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(FontAwesomeIcons.language, size: mSize, color: const Color(0xFF729ee2)),
                                                        SizedBox(width: 10),
                                                    SizedBox(
                                                      height: mSize + 15,
                                                      child: TextButton(
                                                          child: Text('Change Language'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: mSize,)),
                                                          style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                                                          onPressed: () {
                                                            showLanaguageBox(context);
                                                          },
                                                      ),),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(FontAwesomeIcons.users, size: mSize, color: const Color(0xFF729ee2)),
                                                        SizedBox(width: 10),
                                                        SizedBox(
                                                          height: mSize + 15,
                                                          child: TextButton(
                                                            child: Text('Change Additional Information'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: mSize,)),
                                                            style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                                                            onPressed: () async {
                                                              await showAdditionalBox(context);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(FontAwesomeIcons.redo, size: mSize, color: const Color(0xFF729ee2)),
                                                        SizedBox(width: 10),
                                                        SizedBox(
                                                          height: mSize + 15,
                                                          child: TextButton(
                                                            child: Text('Restore Original Information'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: mSize,)),
                                                            style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                                                            onPressed: () async {
                                                              SharedPreferences prefs = await SharedPreferences.getInstance();

                                                              /// Cookie 대용
                                                              await setUser(context, (prefs.getString('OrgEntCode') ?? ''), (prefs.getString('OrgDeptCode') ?? ''), (prefs.getString('OrgEmpCode') ?? ''), (prefs.getString('OrgEmpCode') ?? ''), (prefs.getString('Token') ?? ''));
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(FontAwesomeIcons.unlock, size: mSize, color: const Color(0xFF729ee2)),
                                                        SizedBox(width: 10),
                                                        SizedBox(
                                                          height: mSize + 15,
                                                          child: TextButton(
                                                            child: Text('Password Reset'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: mSize,)),
                                                            style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                                                            onPressed: () {
                                                              showDialogWithFields(context);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(FontAwesomeIcons.solidWindowRestore, size: mSize, color: const Color(0xFF729ee2)),
                                                        SizedBox(width: 10),
                                                        SizedBox(
                                                          height: mSize + 15,
                                                          child: TextButton(
                                                            child: Text('Open Popup (Test)'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: mSize,)),
                                                            style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                                                            onPressed: () {
                                                              showDialogWithFields(context);
                                                            },
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
}