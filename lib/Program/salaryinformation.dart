import 'package:flutter/material.dart';

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class SalaryInformation extends StatefulWidget {
  @override
  _SalaryInformationState createState() => _SalaryInformationState();
}

class _SalaryInformationState extends State<SalaryInformation> {

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
            Icon(Icons.paid, size: 20, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Salary Information', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
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
                                                        Icon(Icons.person_add, size: 18, color: const Color(0xFF729ee2)),
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
    );
  }
}