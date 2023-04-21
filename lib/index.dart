import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jahwa_mobile/common/bubble_bottom_bar.dart';
import 'package:jahwa_mobile/common/function.dart';
import 'package:jahwa_mobile/common/variable.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  void initState() {
    // TODO: implement initState
    super.initState();
    changePage(context);
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
              Icon(FontAwesomeIcons.home, size: bSize, color: Colors.lightGreen),
              Container(padding: EdgeInsets.only(left: 10.0),),
              Flexible(child: Text( session['EntName'].toString() + ' ' + session['DeptName'].toString() + ' ' + session['Name'].toString() + ' ' + session['Position'].toString(), softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: mSize, fontWeight: FontWeight.bold, color: Colors.white))),
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
                              children: <Widget> [
                                Row(
                                  children: <Widget> [
                                    Icon(FontAwesomeIcons.listUl, size: bSize, color: const Color(0xFF729ee2)),
                                    SizedBox(width: 10),
                                    Text('Recent Posts', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            height: 30,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                SizedBox(width: 5),
                                                Flexible(child: Text('Posts 1 가나다라마바사아자차가타파하거너더러머버서어저처커터퍼허고노도로모보소오조초코토포호구누두루무부수우주추쿠투푸후', softWrap: false, overflow: TextOverflow.ellipsis)),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 1"); }, // Handle your callback
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 30,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                SizedBox(width: 5),
                                                Flexible(child: Text('Posts 2 ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz', softWrap: false, overflow: TextOverflow.ellipsis)),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 2"); },
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 30,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                SizedBox(width: 5),
                                                Flexible(child: Text('Posts 3 abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ', softWrap: false, overflow: TextOverflow.ellipsis)),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 3"); },
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 30,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                SizedBox(width: 5),
                                                Flexible(child: Text('Posts 4 123456789 0123456789 0123456789 01234567890', softWrap: false, overflow: TextOverflow.ellipsis)),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 4"); },
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 30,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                SizedBox(width: 5),
                                                Flexible(child: Text('Posts 5 ~!@#%^&*()-=_+[]}|;:",./<>?~!@#%^&*()-=_+[]}|;:",./<>?~!@#%^&*()-=_+[]}|;:",./<>?', softWrap: false, overflow: TextOverflow.ellipsis)),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 5"); },
                                        ),
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
                                    Icon(FontAwesomeIcons.userClock, size: bSize, color: const Color(0xFF729ee2)),
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
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('출퇴근(예정)시간', softWrap: false, overflow: TextOverflow.ellipsis),
                                              SizedBox(height: 10),
                                              Container(
                                                alignment: Alignment.center,
                                                child:Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('08:15', style: TextStyle(fontSize: mSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                    Text(' / 16:55'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('잔업현황', softWrap: false, overflow: TextOverflow.ellipsis),
                                              SizedBox(height: 10),
                                              Container(
                                                alignment: Alignment.center,
                                                child:Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('28.6', style: TextStyle(fontSize: mSize, fontWeight: FontWeight.bold)),
                                                    Text(' / 52'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('연차현황', softWrap: false, overflow: TextOverflow.ellipsis),
                                              SizedBox(height: 10),
                                              Container(
                                                alignment: Alignment.center,
                                                child:Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('17.5', style: TextStyle(fontSize: mSize, fontWeight: FontWeight.bold, color: Colors.black)),
                                                    Text(' / 22'),
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
                                    Icon(FontAwesomeIcons.listAlt, size: bSize, color: const Color(0xFF729ee2)),
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
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              SizedBox(width: 5),
                                              Flexible(child: Text('예고함 : 5', softWrap: false, overflow: TextOverflow.ellipsis)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.deepOrange),
                                              SizedBox(width: 5),
                                              Flexible(child: Text('미결함 : 5', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: mSize, fontWeight: FontWeight.bold, color: Colors.deepOrange))),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              SizedBox(width: 5),
                                              Flexible(child: Text('진행함 : 5', softWrap: false, overflow: TextOverflow.ellipsis)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              SizedBox(width: 5),
                                              Flexible(child: Text('수신함 : 5', softWrap: false, overflow: TextOverflow.ellipsis)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              SizedBox(width: 5),
                                              Flexible(child: Text('참조/회람함 : 952', softWrap: false, overflow: TextOverflow.ellipsis)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              SizedBox(width: 5),
                                              Flexible(child: Text('협조진행함 : 0', softWrap: false, overflow: TextOverflow.ellipsis)),
                                            ],
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
      floatingActionButton: Container(
        height: 45.0,
        width: 45.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () { Navigator.pushNamed(context, '/Favorite'); },
            child: Icon(FontAwesomeIcons.solidStar, size: 15, color: const Color(0xFFC8DEFF),),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: setBottomNavigator(context),
    );
  }


}