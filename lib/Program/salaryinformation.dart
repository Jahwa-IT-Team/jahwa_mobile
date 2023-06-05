import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class SalaryInformation extends StatefulWidget {
  @override
  _SalaryInformationState createState() => _SalaryInformationState();
}

class _SalaryInformationState extends State<SalaryInformation> {

  List yyyymmItem = [];
  List paytypeItem = [];

  String? yyyymmValue = null;
  String? paytypeValue = null;

  List<Widget> allowList = [];
  Widget allow = new Container();
  List<Widget> attendList = [];
  Widget attend = new Container();
  List<Widget> subList = [];
  Widget sub = new Container();

  var totalAmt = '0';
  var subAmt = '0';
  var realAmt = '0';

  void initState() {
    super.initState();
    _setYYYYMM();
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
            Text('Menu.Salary Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
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
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFFFFFFF)),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget> [
                                  Expanded(
                                    flex: 3,
                                    child: Text('Salary Information.YYYYMM'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    flex: 7,
                                    child: DropdownButton(
                                      hint: Text('Select'),
                                      items: yyyymmItem.map((item) {
                                        return DropdownMenuItem(
                                          value: item['Code'].toString(),
                                          child: Text(item['Name'].toString()),
                                        );
                                      }).toList(),
                                      onChanged: (newVal) {
                                        setState(() {
                                          yyyymmValue = newVal;
                                          _setPayType(yyyymmValue);
                                        });
                                      },
                                      value: yyyymmValue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget> [
                                  Expanded(
                                    flex: 3,
                                    child: Text('Salary Information.Pay Type'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    flex: 7,
                                    child: DropdownButton(
                                      hint: Text('Select'),
                                      items: paytypeItem.map((item) {
                                        return DropdownMenuItem(
                                          value: item['Code'].toString(),
                                          child: Text(item['Name'].toString()),
                                        );
                                      }).toList(),
                                      onChanged: (newVal) {
                                        setState(() {
                                          paytypeValue = newVal;
                                          _setSalary();
                                        });
                                      },
                                      value: paytypeValue,
                                    ),
                                  ),
                                ],
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
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                                  Icon(Icons.payments, size: 20, color: const Color(0xFF729ee2)),
                                  SizedBox(width: 10),
                                  Text('Salary Information.Payment Details'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          height: 15,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(flex: 6, child: Text('Salary Information.Name'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 4, child: Text('Salary Information.Amount'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                            ],
                                          )
                                      ),
                                      Divider(
                                        color: Colors.grey, thickness: 1,
                                      ),
                                      for(var allow in allowList ) allow
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
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                                  Icon(Icons.calendar_month, size: 20, color: const Color(0xFF729ee2)),
                                  SizedBox(width: 10),
                                  Text('Salary Information.Attendance Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          height: 15,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(flex: 40, child: Text('Salary Information.Name'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 20, child: Text('Salary Information.Count'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 20, child: Text('Salary Information.Hour'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 20, child: Text('Salary Information.Minute'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                            ],
                                          )
                                      ),
                                      Divider(
                                        color: Colors.grey, thickness: 1,
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
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                                  Icon(Icons.credit_card_off, size: 20, color: const Color(0xFF729ee2)),
                                  SizedBox(width: 10),
                                  Text('Salary Information.Deduction Details'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          height: 15,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(flex: 6, child: Text('Salary Information.Name'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 4, child: Text('Salary Information.Amount'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                            ],
                                          )
                                      ),
                                      Divider(
                                        color: Colors.grey, thickness: 1,
                                      ),
                                      for(var sub in subList ) sub
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
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(15.0),
                                ///margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFFFFFFF)),
                                child: Center(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Salary Information.Total Salary'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$totalAmt'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Salary Information.Deduction Salary'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$subAmt'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Salary Information.Actual Salary'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$realAmt'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
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
                      ],
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

  Future<void> _setYYYYMM() async {
    var url = 'https://jhapi.jahwa.co.kr/MSelectList';
    var data = {'Div': 'PAY_YYMM', 'Data': '', 'EntCode': session['EntCode'].toString(), 'EmpCode': session['EmpCode'].toString()};

    yyyymmItem.clear();

    try {

      await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") {;}
        else if (response.statusCode == 200) {

          setState(() {
            yyyymmItem = jsonDecode(response.body)['Table'];
            yyyymmValue = yyyymmItem.first['Code'];

            _setPayType(yyyymmValue);
          });
        }
      });
    } catch (e) {
      showMessageBox(context, 'Message.Alert'.tr(), "Set YYYYMM Error : " + e.toString());
    }
  }

  Future<void> _setPayType(String? yyyymm) async {
    var url = 'https://jhapi.jahwa.co.kr/MSelectList';
    var data = {'Div': 'PROV_TYPE', 'Data': yyyymm, 'EntCode': session['EntCode'].toString(), 'EmpCode': session['EmpCode'].toString()};

    paytypeItem.clear();

    try {

      await http.post(Uri.parse(url), body: json.encode(data),
          headers: {"Content-Type": "application/json"}).timeout(
          const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") {;}
        else if (response.statusCode == 200) {
          setState(() {
            paytypeItem = jsonDecode(response.body)['Table'];
            paytypeValue = paytypeItem.first['Code'];

            _setSalary();
          });
        }
      });
    } catch (e) {
      showMessageBox(context, 'Message.Alert'.tr(), "Set Pay Type Error : " + e.toString());
    }
  }

  Future<void> _setSalary() async {
    var url = 'https://jhapi.jahwa.co.kr/MSalaryInformation';
    var data = {'PayYYMM': yyyymmValue, 'ProvType': paytypeValue, 'EntCode': session['EntCode'].toString(), 'EmpCode': session['EmpCode'].toString()};

    allowList.clear();
    attendList.clear();
    subList.clear();

    totalAmt = '0';
    subAmt = '0';
    realAmt = '0';

    try {

      await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") {;}
        else if (response.statusCode == 200) {
          setState(() {
            if (jsonDecode(response.body)['Table'].length != 0) {
              jsonDecode(response.body)['Table'].forEach((element) {
                allow = Container(
                    height: 25,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 6, child: Text(element['ALLOW_NM'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                        Expanded(flex: 4, child: Text(element['ALLOW'].toString(), textAlign: TextAlign.right, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                      ],
                    )
                );
                allowList.add(allow);
              });
            }

            if (jsonDecode(response.body)['Table1'].length != 0) {
              jsonDecode(response.body)['Table1'].forEach((element) {
                attend = Container(
                    height: 25,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 40, child: Text(element['DILIG_NM'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                        Expanded(flex: 20, child: Text(element['DILIG_CNT'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                        Expanded(flex: 20, child: Text(element['DILIG_HH'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                        Expanded(flex: 20, child: Text(element['DILIG_MM'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                      ],
                    )
                );
                attendList.add(attend);
              });
            }

            if (jsonDecode(response.body)['Table2'].length != 0) {
              jsonDecode(response.body)['Table2'].forEach((element) {
                sub = Container(
                    height: 25,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 6, child: Text(element['SUB_NM'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                        Expanded(flex: 4, child: Text(element['SUB_AMT'].toString(), textAlign: TextAlign.right, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                      ],
                    )
                );
                subList.add(sub);
              });
            }

            if (jsonDecode(response.body)['Table3'].length != 0) {
              jsonDecode(response.body)['Table3'].forEach((element) {
                totalAmt = element["PROV_TOT_AMT"].toString();
                subAmt = element["SUB_TOT_AMT"].toString();
                realAmt = element["REAL_PROV_AMT"].toString();
              });
            }
          });
        }
      });
    } catch (e) {
      showMessageBox(context, 'Message.Alert'.tr(), "Set Salary Error : " + e.toString());
    }
  }
}