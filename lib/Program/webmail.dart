import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class WebMail extends StatefulWidget {
  @override
  _WebMailState createState() => _WebMailState();
}

class _WebMailState extends State<WebMail> {

  void initState() {
    // TODO: implement initState
    super.initState();
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
            Icon(FontAwesomeIcons.solidEnvelope, size: 20, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Web Mail', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body: Container(
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
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    height: 25,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(FontAwesomeIcons.userPlus, size: sSize, color: const Color(0xFF729ee2)),
                                                        SizedBox(width: 10),
                                                        Flexible(child: Text('Text', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                                      ],
                                                    )
                                                )
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
            onPressed: () { Navigator.pushNamed(context, '/ResetPassword'); },
            child: Icon(FontAwesomeIcons.solidStar, size: 15, color: const Color(0xFFC8DEFF),),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: setBottomNavigator(context),
    );
  }
}