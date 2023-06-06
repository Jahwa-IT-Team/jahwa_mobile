import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class AttendanceInformation extends StatefulWidget {
  @override
  _AttendanceInformationState createState() => _AttendanceInformationState();
}

class _AttendanceInformationState extends State<AttendanceInformation> {

  TextEditingController frdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  DateTime selectedDate = DateTime.now();

  List<Widget> attendList = [];
  Widget attend = new InkWell();

  void initState() {
    // TODO: implement initState
    super.initState();
    frdate.text = DateFormat('yyyy-MM-01').format(selectedDate);
    todate.text = DateFormat('yyyy-MM-dd').format(selectedDate);
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
            Icon(Icons.calendar_month, size: 20, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Menu.Attendance Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
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
                                                    ///mainAxisAlignment: MainAxisAlignment.center,
                                                    ///crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 15,
                                                        child: TextField(
                                                          keyboardType: TextInputType.text,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(color: Colors.black, fontSize: sSize),
                                                          decoration: InputDecoration (
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.black26)
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.blueAccent)
                                                              )
                                                          ),
                                                          controller: frdate, //editing controller of this TextField
                                                          readOnly: true,  //set it true, so that user will not able to edit text
                                                          onTap: () async {
                                                            _selectDate(context, 'frdate');
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: Colors.transparent)
                                                        ),
                                                        child: Center(child: const Text(' ~ ', textAlign: TextAlign.center,)),
                                                      ),
                                                      Expanded(
                                                        flex: 15,
                                                        child: TextField(
                                                          keyboardType: TextInputType.text,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(color: Colors.black, fontSize: sSize),
                                                          decoration: InputDecoration (
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black26)
                                                            ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: Colors.blueAccent)
                                                              )
                                                          ),
                                                          controller: todate, //editing controller of this TextField
                                                          readOnly: true,  //set it true, so that user will not able to edit text
                                                          onTap: () async {
                                                            _selectDate(context, 'todate');
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Expanded(
                                                        flex: 7,
                                                        child: ButtonTheme(
                                                          child: ElevatedButton(
                                                            child:Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(Icons.search, size: 15),
                                                              ],
                                                            ),
                                                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15)),
                                                            onPressed: () async {
                                                              await findAttendanceInformation(context, frdate, todate);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ),
                                                Divider(
                                                  color: Colors.grey, thickness: 1,
                                                ),
                                                Container(
                                                  height: 25,
                                                  child: Row(
                                                    children: <Widget> [
                                                      Expanded(
                                                          flex: 10,
                                                          child:Text('Attendance Information.Date'.tr(), textAlign: TextAlign.center,)
                                                      ),
                                                      Expanded(
                                                          flex: 10,
                                                          child:Text('Attendance Information.Week Day'.tr(), textAlign: TextAlign.center,)
                                                      ),
                                                      Expanded(
                                                          flex: 10,
                                                          child:Text('Attendance Information.Start Time'.tr(), textAlign: TextAlign.center)
                                                      ),
                                                      Expanded(
                                                          flex: 10,
                                                          child:Text('Attendance Information.End Time'.tr(), textAlign: TextAlign.center)
                                                      ),
                                                    ]
                                                  ),
                                                ),
                                                for(var attend in attendList ) attend
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

  Future<void> _selectDate(BuildContext context, String div) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2200));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        setState(() {
          if(div == 'frdate') frdate.text = formattedDate;
          else todate.text = formattedDate;
        });
      });
    }
    else{
      showMessageBox(context, 'Message.Alert'.tr(), "Attendance Information.Date is not selected".tr());
    }
  }

  /// Get DB Data
  Future<void> findAttendanceInformation(BuildContext context, TextEditingController frdate, TextEditingController todate) async {

    if(session['Email'].toString() == '') {
      showMessageBox(context, 'Message.Alert'.tr(), 'Message.If you do not have permission, only your own information is retrieved'.tr());
      return;
    }

    if(frdate.text.isEmpty) {
      showMessageBox(context, 'Message.Alert'.tr(), 'Message.From Date Not Exists !!!'.tr());
      return;
    }

    if(todate.text.isEmpty) {
      showMessageBox(context, 'Message.Alert'.tr(), 'Message.To Date Not Exists !!!'.tr());
      return;
    }

    attendList.clear();

    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: true,
      progressBgColor: Colors.transparent,
      msg: "Search Data...",
      hideValue: true,
    );

    var url = 'https://jhapi.jahwa.co.kr/MAttendanceInformation';
    var data = {'FrDate': frdate.text, 'ToDate': todate.text, 'EntCode': session['EntCode'].toString(), 'EmpCode': session['EmpCode'].toString()};

    try {

      await http.post(Uri.parse(url), body: json.encode(data),
          headers: {"Content-Type": "application/json"}).timeout(
          const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") { pd.close(); }
        else if (response.statusCode == 200) {
          if (jsonDecode(response.body)['Table'].length != 0) {
            jsonDecode(response.body)['Table'].forEach((element) {
              attend = InkWell(
                onTap: () {
                  showDetailInfo(context, element['DATE'].toString(), element['WEEK_DAY'].toString(), element['HOLI_TYPE'].toString(), element['REMARK'].toString(), element['WORK_SHIFT'].toString(), element['WORK_TYPE'].toString(), element['STRT_TIME'].toString(), element['END_TIME'].toString());
                }, // Handle your callback
                child: Container(
                  height: 25,
                  child: Row(
                    children: <Widget> [
                      Expanded(
                          flex: 10,
                          child:Text(element['DATE'].toString(), textAlign: TextAlign.center,)
                      ),
                      Expanded(
                          flex: 10,
                          child:Text(element['WEEK_DAY'].toString(), textAlign: TextAlign.center, style: TextStyle(color: element['HOLI_TYPE'].toString() == 'H' ? Colors.red : (element['HOLI_TYPE'].toString() == 'S' ? Colors.blue : Colors.black)))
                      ),
                      Expanded(
                          flex: 10,
                          child:Text(element['STRT_TIME'].toString(), textAlign: TextAlign.center)
                      ),
                      Expanded(
                          flex: 10,
                          child:Text(element['END_TIME'].toString(), textAlign: TextAlign.center)
                      ),
                    ]
                  )
                ),
              );

              attendList.add(attend);
            });
          }
        }
      });
    } catch (e) {
      print("set Information Error : " + e.toString());
      pd.close();
    }

    setState(() {
      pd.close();
    });
  }

  void showDetailInfo(BuildContext context, String Date, String WeekDay, String HoliType, String Remark, String WorkShift, String WorkType, String StartTime, String EndTime) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body:InkWell(
            onTap: () {
              Navigator.of(context).pop();
            }, // Handle your callback
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(color: Colors.transparent),
              alignment: Alignment.center,
              child: Container(
                width: screenWidth - 100,
                height: 250,
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column (
                  children: <Widget> [
                    Container(
                      height:25,
                      child: Row(
                        children: <Widget> [
                          Expanded(flex: 5, child:Text('Attendance Information.Date'.tr(), textAlign: TextAlign.right,)),
                          SizedBox(width: 20),
                          Expanded(flex: 10, child:Text(Date, textAlign: TextAlign.left,)),
                        ]
                      ),
                    ),
                    Container(
                      height:25,
                      child: Row(
                        children: <Widget> [
                          Expanded(flex: 5, child:Text('Attendance Information.Week Day'.tr(), textAlign: TextAlign.right,)),
                          SizedBox(width: 20),
                          Expanded(flex: 10, child:Text(WeekDay, textAlign: TextAlign.left,)),
                        ]
                      ),
                    ),
                    Container(
                      height:25,
                      child: Row(
                        children: <Widget> [
                          Expanded(flex: 5, child:Text('Attendance Information.Holiday Type'.tr(), textAlign: TextAlign.right,)),
                          SizedBox(width: 20),
                          Expanded(flex: 10, child:Text(HoliType, textAlign: TextAlign.left,)),
                        ]
                      ),
                    ),
                    Container(
                      height:25,
                      child: Row(
                        children: <Widget> [
                          Expanded(flex: 5, child:Text('Attendance Information.Remark'.tr(), textAlign: TextAlign.right,)),
                          SizedBox(width: 20),
                          Expanded(flex: 10, child:Text(Remark, textAlign: TextAlign.left,)),
                        ]
                      ),
                    ),
                    Container(
                      height:25,
                      child: Row(
                        children: <Widget> [
                          Expanded(flex: 5, child:Text('Attendance Information.Work Shift'.tr(), textAlign: TextAlign.right,)),
                          SizedBox(width: 20),
                          Expanded(flex: 10, child:Text(WorkShift, textAlign: TextAlign.left,)),
                        ]
                      ),
                    ),
                    Container(
                      height:25,
                      child: Row(
                        children: <Widget> [
                          Expanded(flex: 5, child:Text('Attendance Information.Work Type'.tr(), textAlign: TextAlign.right,)),
                          SizedBox(width: 20),
                          Expanded(flex: 10, child:Text(WorkType, textAlign: TextAlign.left,)),
                        ]
                      ),
                    ),
                    Container(
                      height:25,
                      child: Row(
                        children: <Widget> [
                          Expanded(flex: 5, child:Text('Attendance Information.Start Time'.tr(), textAlign: TextAlign.right,)),
                          SizedBox(width: 20),
                          Expanded(flex: 10, child:Text(StartTime, textAlign: TextAlign.left,)),
                        ]
                      ),
                    ),
                    Container(
                      height:25,
                      child: Row(
                          children: <Widget> [
                            Expanded(flex: 5, child:Text('Attendance Information.End Time'.tr(), textAlign: TextAlign.right,)),
                            SizedBox(width: 20),
                            Expanded(flex: 10, child:Text(EndTime, textAlign: TextAlign.left,)),
                          ]
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}