import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';


class AnnualLeaveInformation extends StatefulWidget {
  @override
  _AnnualLeaveInformationState createState() => _AnnualLeaveInformationState();
}

class _AnnualLeaveInformationState extends State<AnnualLeaveInformation> {

  List yyyyItem = [];
  String? yyyyValue = null;

  List<Widget> annualList = [];
  Widget annual = new Container();

  var YearSave = 0.0;
  var YearPart = 0.0;
  var YearSaveTot = 0.0;
  var YearUse = 0.0;
  var YearRemain = 0.0;

  var use01 = 0.0;
  var use02 = 0.0;
  var use03 = 0.0;
  var use04 = 0.0;
  var use05 = 0.0;
  var use06 = 0.0;
  var use07 = 0.0;
  var use08 = 0.0;
  var use09 = 0.0;
  var use10 = 0.0;
  var use11 = 0.0;
  var use12 = 0.0;

  void initState() {
    // TODO: implement initState
    super.initState();
    _setYYYY();
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
            Icon(Icons.sailing, size: 20, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Menu.Annual Leave Information'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5.0),
                                ///margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFFFFFFF)),
                                child: Center(
                                  child: Row(
                                    children: <Widget> [
                                      Expanded(
                                        flex: 25,
                                        child: Text('Annual Leave Information.YYYY'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 30,
                                        child: DropdownButton(
                                          hint: Text('Select'),
                                          items: yyyyItem.map((item) {
                                            return DropdownMenuItem(
                                              value: item['Code'].toString(),
                                              child: Text(item['Name'].toString()),
                                            );
                                          }).toList(),
                                          onChanged: (newVal) {
                                            setState(() {
                                              yyyyValue = newVal;
                                            });
                                          },
                                          value: yyyyValue,
                                        ),
                                      ),
                                      SizedBox(width: 10),
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
                              Row(
                                children: <Widget>[
                                  Icon(Icons.payments, size: 20, color: const Color(0xFF729ee2)),
                                  SizedBox(width: 10),
                                  Text('Annual Leave Information.Annual Generation History'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(15.0),
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFFFFFFF)),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Annual Leave Information.Base Annual Leave'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                          SizedBox(height: 10),
                                          Text('$YearSave'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Annual Leave Information.Additional Annual Leave'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                          SizedBox(height: 10),
                                          Text('$YearPart'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Annual Leave Information.Annual Leave Total'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                          SizedBox(height: 10),
                                          Text('$YearSaveTot'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Annual Leave Information.Annual Leave Use'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                          SizedBox(height: 10),
                                          Text('$YearUse'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Annual Leave Information.Annual Leave Remain'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                          SizedBox(height: 10),
                                          Text('$YearRemain'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
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
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
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
                                  Text('Annual Leave Information.Monthly Annual Usage Status'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(15.0),
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFFFFFFF)),
                                child: Center(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 01'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use01'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 02'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use02'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 03'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use03'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 04'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use04'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 05'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use05'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 06'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use06'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 07'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use07'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 08'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use08'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 09'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use09'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 10'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use10'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 11'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use11'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Month 12'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$use12'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Annual Leave Information.Total Use'.tr(), softWrap: false, overflow: TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Text('$YearUse'.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
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
                                  Text('Annual Leave Information.Annual Leave Details'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.black54)),
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
                                              Expanded(flex: 10, child: Text('Annual Leave Information.Date'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 5, child: Text('Annual Leave Information.Name'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 5, child: Text('Annual Leave Information.Time'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 20, child: Text('Annual Leave Information.Comment'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                            ],
                                          )
                                      ),
                                      Divider(
                                        color: Colors.grey, thickness: 1,
                                      ),
                                      for(var annual in annualList ) annual
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

  Future<void> _setYYYY() async {
    var url = 'https://jhapi.jahwa.co.kr/MSelectList';
    var data = {'Div': 'ANNUAL_YYYY', 'Data': '', 'EntCode': session['EntCode'].toString(), 'EmpCode': session['EmpCode'].toString()};

    yyyyItem.clear();

    try {

      await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") {;}
        else if (response.statusCode == 200) {

          setState(() {
            yyyyItem = jsonDecode(response.body)['Table'];
            yyyyValue = yyyyItem.first['Code'];

            _setAnnualLeave();
          });
        }
      });
    } catch (e) {
      showMessageBox(context, 'Message.Alert'.tr(), "Set YYYY Error : " + e.toString());
    }
  }

  Future<void> _setAnnualLeave() async {
    var url = 'https://jhapi.jahwa.co.kr/MAnnualLeaveInformation';
    var data = {'YYYY': yyyyValue, 'EmpCode': session['EmpCode'].toString()};

    annualList.clear();

    YearSave = 0.0;
    YearPart = 0.0;
    YearSaveTot = 0.0;
    YearUse = 0.0;
    YearRemain = 0.0;

    use01 = 0.0;
    use02 = 0.0;
    use03 = 0.0;
    use04 = 0.0;
    use05 = 0.0;
    use06 = 0.0;
    use07 = 0.0;
    use08 = 0.0;
    use09 = 0.0;
    use10 = 0.0;
    use11 = 0.0;
    use12 = 0.0;

    try {

      await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") {;}
        else if (response.statusCode == 200) {
          setState(() {
            if (jsonDecode(response.body)['Table1'].length != 0) {
              jsonDecode(response.body)['Table1'].forEach((element) {
                YearUse = element["TOTAL"];
                use01 = element["MON1"];
                use02 = element["MON2"];
                use03 = element["MON3"];
                use04 = element["MON4"];
                use05 = element["MON5"];
                use06 = element["MON6"];
                use07 = element["MON7"];
                use08 = element["MON8"];
                use09 = element["MON9"];
                use10 = element["MON10"];
                use11 = element["MON11"];
                use12 = element["MON12"];
              });
            }

            if (jsonDecode(response.body)['Table'].length != 0) {
              jsonDecode(response.body)['Table'].forEach((element) {
                YearSave = element["YEAR_SAVE"];
                YearPart = element["YEAR_PART"];
                YearSaveTot = element["YEAR_SAVE_TOT"];
              });
            }

            YearRemain = YearSaveTot - YearUse;

            if (jsonDecode(response.body)['Table2'].length != 0) {
              jsonDecode(response.body)['Table2'].forEach((element) {
                annual = Container(
                    height: 25,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 10, child: Text(element['DILIG_DT'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                        Expanded(flex: 5, child: Text(element['DILIG_NM'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                        Expanded(flex: 5, child: Text(element['DILIG_HH'].toString(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                        Expanded(flex: 20, child: Text(element['REMARK'].toString(), textAlign: TextAlign.left, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                      ],
                    )
                );
                annualList.add(annual);
              });
            }
          });
        }
      });
    } catch (e) {
      showMessageBox(context, 'Message.Alert'.tr(), "Set Annual Leave Error : " + e.toString());
    }
  }
}