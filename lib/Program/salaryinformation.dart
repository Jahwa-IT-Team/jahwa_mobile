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

  List<DropdownMenuItem<String>> yyyymmItems = [];

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
    _setYYYYMM().then((result) {
      setState(() {
        ;
      });
    });
    super.initState();
  }

  String? yyyymmValue = null;
  String? paytypeValue = null;

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
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(15.0),
                                ///margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFFFFFFF)),
                                child: Center(
                                  child: Row(
                                    children: <Widget> [
                                      Expanded(
                                        flex: 25,
                                        child: Text('Salary Information.YYYYMM'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 30,
                                        child: FutureBuilder(
                                            future: getDBData('MSelectList'),
                                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                                              if (!snapshot.hasData) return CircularProgressIndicator();
                                              else if (snapshot.hasError) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text('Error: ${snapshot.error}', style: TextStyle(fontSize: 15),),
                                                );
                                              }
                                              else {
                                                if (snapshot.data != '') {
                                                  yyyymmItems.clear();
                                                  if (jsonDecode(snapshot.data)['Table'].length != 0) {
                                                    jsonDecode(snapshot.data)['Table'].forEach((element) {
                                                      yyyymmItems.add(DropdownMenuItem(child: Text(element['Name'].toString()), value: element['Code'].toString()),);
                                                    });
                                                  }
                                                }
                                              }

                                              if(yyyymmValue == null) yyyymmValue = yyyymmItems.first.value.toString();

                                              return DropdownButton(
                                                  value: yyyymmValue,
                                                  onChanged: (String? newValue){
                                                    setState(() {
                                                      yyyymmValue = newValue!;
                                                    });
                                                  },
                                                  items: yyyymmItems,
                                              );
                                          }
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 20,
                                        child: Text('Salary Information.Pay Type'.tr(), textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 25,
                                        child: DropdownButton<String>(
                                          value: paytypeValue,
                                          style: const TextStyle(color: Colors.black),
                                          onChanged: (String? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              paytypeValue = value!;
                                            });
                                          },
                                          items: paytypeList.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value, softWrap: false, overflow: TextOverflow.ellipsis),
                                            );
                                          }).toList(),
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
                                              Expanded(flex: 6, child: Text('Name', textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 4, child: Text('Amount', textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
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
                                              Expanded(flex: 40, child: Text('Name', textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 20, child: Text('Count', textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 20, child: Text('Hour', textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 20, child: Text('Minute', textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
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
                                              Expanded(flex: 6, child: Text('Name', textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
                                              Expanded(flex: 4, child: Text('Amount', textAlign: TextAlign.center, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: sSize, color: Colors.black))),
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
/*
FutureBuilder(
future: getDBData('MSalaryInformation'),
builder: (BuildContext context, AsyncSnapshot snapshot) {



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

if (jsonDecode(snapshot.data)['Table1'].length != 0) {
jsonDecode(snapshot.data)['Table1'].forEach((element) {
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

if (jsonDecode(snapshot.data)['Table2'].length != 0) {
jsonDecode(snapshot.data)['Table2'].forEach((element) {
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

if (jsonDecode(snapshot.data)['Table3'].length != 0) {
jsonDecode(snapshot.data)['Table3'].forEach((element) {
totalAmt = element["PROV_TOT_AMT"].toString();
subAmt = element["SUB_TOT_AMT"].toString();
realAmt = element["REAL_PROV_AMT"].toString();
});
}
}
else { /// jsondata == ''
;
}

return*/

  Future<void> _setYYYYMM() async {
    var jsondata = '';
    var url = 'https://jhapi.jahwa.co.kr/MSelectList';
    var data = {'Div': 'PAY_YYMM', 'Data': '', 'EntCode': session['EntCode'].toString(), 'EmpCode': session['EmpCode'].toString()};

    try {

      await http.post(Uri.parse(url), body: json.encode(data),
          headers: {"Content-Type": "application/json"}).timeout(
          const Duration(seconds: 15)).then<void>((http.Response response) {
        if (response.statusCode != 200 || response.body == "{}") {;}
        else if (response.statusCode == 200) {
          if (jsonDecode(response.body)['Table1'].length != 0) {
            jsonDecode(response.body)['Table1'].forEach((element) {
              yyyymmList.add(element['Code'].toString());
            });
          }
        }
      });

      yyyymmValue = yyyymmList.first;
      paytypeValue = paytypeList.first;
    } catch (e) {
      print("set Information Error : " + e.toString());
    }
  }
}
