import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class PersonalInformationERP extends StatefulWidget {
  @override
  _PersonalInformationERPState createState() => _PersonalInformationERPState();
}

class _PersonalInformationERPState extends State<PersonalInformationERP> {

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
            Icon(Icons.person, size: 20, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Personal Information (ERP)'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body:
      FutureBuilder(
          future: getDBData('MPersonalInformationERP'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            var company = 'Company'.tr();
            var empno = 'Employee No.'.tr();
            var name = 'Name'.tr();
            var hanjaname = 'HanJa Name'.tr();
            var engname = 'English Name'.tr();
            var deptnm = 'Department'.tr();

            var rollpstnnm = 'Position'.tr();
            var rolecdnm = 'Title'.tr();
            var ocpttypenm = 'Occupation Type'.tr();
            var funccdnm = 'Work Type'.tr();
            var entrcdnm = 'Enter Type'.tr();

            var groupentrdt = 'Group Enter Date'.tr();
            var entrdt = 'EnterDate'.tr();
            var memodt = 'Probationary Expiration Date'.tr();
            var retiredt = 'Retire Date'.tr();

            var sex = 'Sex'.tr();
            var zipcd = 'Zip Code of Resident Registration Address'.tr();
            var addr = 'Resident Registration Address'.tr();
            var currzipcd = 'Current Zip Code'.tr();
            var curraddr = 'Current Address'.tr();
            var telno = 'Sex'.tr();
            var emtelno = 'Sex'.tr();
            var emailaddr = 'Email'.tr();
            var handtelno = 'Mobile'.tr();


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
                    company = session['EntName'].toString();
                    empno = element['EMP_NO'].toString();
                    name = element['NAME'].toString();
                    hanjaname = element['HANJA_NAME'].toString();
                    engname = element['ENG_NAME'].toString();
                    deptnm = element['DEPT_NM'].toString();

                    rollpstnnm = element['ROLL_PSTN_NM'].toString();
                    rolecdnm = element['ROLE_CD_NM'].toString();
                    ocpttypenm = element['OCPT_TYPE_NM'].toString();
                    funccdnm = element['FUNC_CD_NM'].toString();
                    entrcdnm = element['ENTR_CD_NM'].toString();

                    groupentrdt = element['GROUP_ENTR_DT'].toString();
                    entrdt = element['ENTR_DT'].toString();
                    memodt = element['MEMO_DT'].toString();
                    retiredt = element['RETIRE_DT'].toString();

                    sex = element['SEX_NM'].toString();
                    zipcd = element['ZIP_CD'].toString();
                    addr = element['ADDR'].toString();
                    currzipcd = element['CURR_ZIP_CD'].toString();
                    curraddr = element['CURR_ADDR'].toString();
                    telno = element['TEL_NO'].toString();
                    emtelno = element['EM_TEL_NO'].toString();
                    emailaddr = element['EMAIL_ADDR'].toString();
                    handtelno = element['HAND_TEL_NO'].toString();
                  });
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
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(20.0),
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              _setTitleNData('PersonalInformationERP.Company', company),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Department', deptnm),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Employee No.', empno),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Name', name),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Chinese Name', hanjaname),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.English Name', engname),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Position', rollpstnnm),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Title', rolecdnm),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Occupation Type', ocpttypenm),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Work Type', funccdnm),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Enter Type', entrcdnm),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Group Enter Date', groupentrdt),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Enter Date', entrdt),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Probationary Expiration Date', memodt),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Retire Date', retiredt),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Sex', sex),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Zip Code', zipcd),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Address', addr),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Current Zip Code', currzipcd),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Current Address', curraddr),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Telephone', telno),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Office Phone', emtelno),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Email', emailaddr),
                                              SizedBox(height: 15),
                                              _setTitleNData('PersonalInformationERP.Mobile', handtelno),
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
    );
  }

  Widget _setTitleNData(String Title, String Data) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 35,
          child: Container(
            padding: EdgeInsets.only(right:5,),
            alignment: Alignment.centerLeft,
            child: Text(Title.tr(),
              style: TextStyle(fontSize: mSize),
              softWrap: false, overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.only(right:10,),
            alignment: Alignment.centerLeft,
            child: Text(':',
              style: TextStyle(fontSize: mSize),
              softWrap: false, overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          flex: 60,
          child: Text(Data,
            style: TextStyle(fontSize: mSize),
            softWrap: false, overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}