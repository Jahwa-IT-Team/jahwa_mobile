import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  var empcode = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
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
              IconButton(
                iconSize: bSize,
                color: Colors.lightGreen,
                icon: const Icon(Icons.home, size: 20),
                tooltip: 'Index.Logout',
                onPressed:  () async {
                  await removeUserSharedPreferences();
                  Navigator.pushReplacementNamed(context, '/');
                }
              ),
              Flexible(child: Text( session['EntName'].toString() + ' ' + session['DeptName'].toString() + ' ' + session['Name'].toString() + ' ' + session['Position'].toString(), softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: mSize, fontWeight: FontWeight.bold, color: Colors.white))),
            ],
          ),
        ),
        body:
        FutureBuilder(
            future: getDBData('MPortalQuery'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              var sttime = '08:00';
              var edtime = '17:00';
              var addtime = '0:00';
              var addtimelimit = '80:00';
              var annualleaveall = '0.00';
              var annualleaveuse = '0.00';

              var preapproval = '0';
              var unapproved = '0';
              var ongoing = '0';
              var deptreceived = '0';
              var circulation = '0';
              var cooperation = '0';

              var cnt = 5;

              List<Widget> postsList = [];
              Widget posts = new InkWell();
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
                  if (jsonDecode(snapshot.data)['Table'].length != 0) {
                    jsonDecode(snapshot.data)['Table'].forEach((element) {
                      if(cnt >= 0) {
                        string = element['Subject'].toString();
                        posts = InkWell(
                          onTap: () async {
                            print("Click event on : " + element['Code'].toString() + '/' + element['Num'].toString());
                            viewBBSData(context, element['Div'].toString(), element['Num'].toString());
                          }, // Handle your callback
                          child: Container(
                            height: 30,
                            child: Row(
                              children: <Widget> [
                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                SizedBox(width: 5),
                                Flexible(child: Text(string, softWrap: false, overflow: TextOverflow.ellipsis)),
                              ],
                            ),
                          ),
                        );

                        postsList.add(posts);
                        cnt --;
                      }
                      else {
                        ;
                      }
                    });
                  }
                  else { /// No Data
                    ;
                  }

                  if (jsonDecode(snapshot.data)['Table1'].length != 0) {
                    jsonDecode(snapshot.data)['Table1'].forEach((element) {
                      sttime = element['StTime'].toString();
                      edtime = element['EdTime'].toString();
                      addtime = element['AddTime'].toString();
                      addtimelimit = element['AddTimeLimit'].toString();
                      annualleaveall = element['AnnualLeaveAll'].toString();
                      annualleaveuse = element['AnnualLeaveUse'].toString();
                      ;
                    });
                  }
                  else { /// No Data
                    ;
                  }

                  if (jsonDecode(snapshot.data)['Table2'].length != 0) {
                    jsonDecode(snapshot.data)['Table2'].forEach((element) {
                      preapproval = element['PreApproval'].toString();
                      unapproved = element['UnApproved'].toString();
                      ongoing = element['OnGoing'].toString();
                      deptreceived = element['DeptReceived'].toString();
                      circulation = element['Circulation'].toString();
                      cooperation = element['Cooperation'].toString();
                      ;
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
                            child : SingleChildScrollView ( // this will make your body scrollable
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    /// Recent Posts
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
                                                      Icon(Icons.list, size: 20, color: const Color(0xFF729ee2)),
                                                      SizedBox(width: 10),
                                                      Text('Recent Posts'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                                    ],
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10.0),
                                                    margin: EdgeInsets.only(top: 10),
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                                    child: Center(
                                                      child: Column(
                                                        children: <Widget>[
                                                          for(var posts in postsList ) posts
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
                                    /// My Working Time
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child: Column(
                                                children: <Widget> [
                                                  Row(
                                                    children: <Widget> [
                                                      Icon(Icons.work_history, size: 20, color: const Color(0xFF729ee2)),
                                                      SizedBox(width: 10),
                                                      Text('My Working Time', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                                    ],
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(15.0),
                                                    margin: EdgeInsets.only(top: 10),
                                                    child: Center(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            ///flex: 4,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: <Widget>[
                                                                Text('Working Time', softWrap: false, overflow: TextOverflow.ellipsis),
                                                                SizedBox(height: 10),
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child:Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: <Widget>[
                                                                      Text(sttime + ' / ' + edtime),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            ///flex: 3,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: <Widget>[
                                                                Text('Over Time', softWrap: false, overflow: TextOverflow.ellipsis),
                                                                SizedBox(height: 10),
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child:Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: <Widget>[
                                                                      Text(addtime, style: TextStyle(fontWeight: FontWeight.bold)),
                                                                      Text(' / ' + addtimelimit),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            ///flex: 3,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: <Widget>[
                                                                Text('Annual Leave', softWrap: false, overflow: TextOverflow.ellipsis),
                                                                SizedBox(height: 10),
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child:Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: <Widget>[
                                                                      Text(annualleaveuse, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                                                      Text(' / ' + annualleaveall),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFFFFFFF)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                                    ),
                                    /// Worklist
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child: Column(
                                                children: <Widget> [
                                                  Row(
                                                    children: <Widget> [
                                                      Icon(Icons.list_alt, size: 20, color: const Color(0xFF729ee2)),
                                                      SizedBox(width: 10),
                                                      Text('Worklist', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                                    ],
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10.0),
                                                    margin: EdgeInsets.only(top: 10),
                                                    child: IntrinsicGridView.vertical(
                                                      columnCount: 2,
                                                      verticalSpace: 15,
                                                      horizontalSpace: 15,
                                                      children: [
                                                        InkWell(
                                                          onTap: () { print("Click event on : Forenotice Tray"); }, // Handle your callback
                                                          child: Container(
                                                            child: Row(
                                                              children: <Widget> [
                                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                                SizedBox(width: 5),
                                                                Flexible(child: Text('Forenotice Tray : ' + preapproval, softWrap: false, overflow: TextOverflow.ellipsis)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () { print("Click event on : In Tray"); }, // Handle your callback
                                                          child: Container(
                                                            child: Row(
                                                              children: <Widget> [
                                                                Icon(Icons.circle, size: 8, color: Colors.deepOrange),
                                                                SizedBox(width: 5),
                                                                Flexible(child: Text('In Tray : ' + unapproved, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: mSize, fontWeight: FontWeight.bold, color: Colors.deepOrange))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () { print("Click event on : Progress Tray"); }, // Handle your callback
                                                          child: Container(
                                                            child: Row(
                                                              children: <Widget> [
                                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                                SizedBox(width: 5),
                                                                Flexible(child: Text('Progress Tray : ' + ongoing, softWrap: false, overflow: TextOverflow.ellipsis)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () { print("Click event on : Received Tray"); }, // Handle your callback
                                                          child: Container(
                                                            child: Row(
                                                              children: <Widget> [
                                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                                SizedBox(width: 5),
                                                                Flexible(child: Text('Received Tray : ' + deptreceived, softWrap: false, overflow: TextOverflow.ellipsis)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () { print("Click event on : Reference & Circulation Tray"); }, // Handle your callback
                                                          child: Container(
                                                            child: Row(
                                                              children: <Widget> [
                                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                                SizedBox(width: 5),
                                                                Flexible(child: Text('Reference. Tray : ' + circulation, softWrap: false, overflow: TextOverflow.ellipsis)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () { print("Click event on : Cooperation Progress Tray"); }, // Handle your callback
                                                          child: Container(
                                                            child: Row(
                                                              children: <Widget> [
                                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                                SizedBox(width: 5),
                                                                Flexible(child: Text('Cooperation. Tray : ' + cooperation, softWrap: false, overflow: TextOverflow.ellipsis)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ), //
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFFFFFFF)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                                    ),
                                  ],
                                ),
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
            backgroundColor: Colors.green,
            onPressed: () { Navigator.pushNamed(context, '/'); },
            child: Icon(Icons.star, size: 25, color: Colors.white,),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: setBottomNavigator(context),
    );
  }
}