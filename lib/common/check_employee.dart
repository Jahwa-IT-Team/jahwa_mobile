import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class CheckEmployee extends StatefulWidget {
  @override
  _CheckEmployeeState createState() => _CheckEmployeeState();
}

class _CheckEmployeeState extends State<CheckEmployee> {

  TextEditingController empcodeController = new TextEditingController(); /// Employee Number Data Controller
  TextEditingController nameController = new TextEditingController(); /// Name Data Controller

  FocusNode empcodeFocusNode = FocusNode(); /// Employee Number Input Focus
  FocusNode nameFocusNode = FocusNode(); /// Name Input Focus

  var Company = "";

  void initState() {
    super.initState();
    print("open Check Employee Page : " + DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width; /// Screen Width
    screenHeight = MediaQuery.of(context).size.height; /// Screen Height
    statusBarHeight = MediaQuery.of(context).padding.top; /// Status Bar Height

    var baseWidth = screenWidth * 0.65;
    if(baseWidth > 280) baseWidth = 280;

    return GestureDetector( /// Keyboard UnFocus시를 위해 onTap에 GestureDetector를 위치시킴
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) { currentFocus.unfocus(); }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 45,
          backgroundColor: const Color(0xFF729ee2),
          elevation: 0.0,
          title:Row(
            children: <Widget> [
              Icon(FontAwesomeIcons.userCheck, size: bSize, color: Colors.lightGreen),
              Container(padding: EdgeInsets.only(left: 10.0),),
              Text('Check Employee', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
        body: SingleChildScrollView ( /// Scroll이 생기도록 하는 Object
          child: Container(
            height: screenHeight,
            width: screenWidth,
            color: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
            child: Column(
              children: <Widget>[
                Container( /// Jahwa Mark
                  width: screenWidth,
                  height: (screenHeight - statusBarHeight) * 0.15,
                  alignment: Alignment.center,
                  child: Text('Check Employee', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black,)),
                ),
                Container( /// Input Area
                  width: screenWidth,
                  alignment: Alignment.center,
                  child: Container(
                    width: baseWidth,
                    height: (screenHeight - statusBarHeight) * 0.85,
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget> [
                        SizedBox(height: 16,),
                        TextField(
                          autofocus: false,
                          controller: empcodeController,
                          focusNode: empcodeFocusNode,
                          keyboardType: TextInputType.text,
                          onSubmitted: (String inputText) {
                            FocusScope.of(context).requestFocus(nameFocusNode);  /// Input Box에서 Enter 적용시 Password 입력 Box로 이동됨
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                              borderSide: new BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            labelText: 'Employee Number',
                            contentPadding: EdgeInsets.all(10),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 16,),
                        TextField(
                          autofocus: false,
                          controller: nameController,
                          focusNode: nameFocusNode,
                          keyboardType: TextInputType.text,
                          onSubmitted: (String inputText) async {
                            checkEmployee(context, empcodeController, nameController); /// 수동으로 로그인 프로세스를 실행시킴
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                              borderSide: new BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            labelText: 'Name',
                            contentPadding: EdgeInsets.all(10),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 16,),
                        ElevatedButton(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.userCheck, size: 16),
                              SizedBox(height: 45, width: 20),
                              Text('Check Employee', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,)),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                          onPressed: () async {
                            checkEmployee(context, empcodeController, nameController) ;
                          },
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

  /// Check Employee
  Future<void> checkEmployee(BuildContext context, TextEditingController empcodeController, TextEditingController nameController) async {

    if(empcodeController.text.isEmpty || nameController.text.isEmpty) { showMessageBox(context, 'Alert', 'Employee Number Or Name Not Exists !!!'); } /// Employee Number and Name Empty Check
    else {
      try {

        // Login API Url
        var url = 'https://jhapi.jahwa.co.kr/MCheckEmployee';
        // Send Parameter
        var data = {'Company': Company, 'EmpCode': empcodeController.text, 'Name' : nameController.text};

        return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
          if(response.statusCode != 200 || response.body == null || response.body == "{}" ){
            showMessageBox(context, "Alert", "Check Employee Error : " + response.body.toString());
          }
          if(response.statusCode == 200){
            if (response.body == "User does not exist." || response.body == "User Name is incorrect." || response.body == "Error") showMessageBox(context, "Alert", response.body);
            else if (response.body == "A/D Not Use.") {
              resetpass['empcode'] = empcodeController.text;
              Navigator.pushNamed(context, '/ResetPasswordResNo'); ///주민등록번호를 이용한 비밀번호 초기화로 이동
            }
            else {
              if(jsonDecode(response.body)['DATA'].length != 0) {
                jsonDecode(response.body)['DATA'].forEach((element) {

                  resetpass['company'] = element['Company'].toString();
                  resetpass['empcode'] = empcodeController.text;
                  resetpass['name'] = nameController.text;
                  resetpass['question1'] = element['Question1'].toString();
                  resetpass['question2'] = element['Question2'].toString();
                  Company = element['Company'].toString();

                  if (element['Question1'].toString() == "" || element['Question2'].toString() == "") {
                    Navigator.pushNamed(context, '/ResetPasswordResNo'); ///주민등록번호를 이용한 비밀번호 초기화로 이동
                  }
                  else {
                    if (element['Dispatch'].toString() == "0" && (Company == 'KO532' || Company == 'KO536')) {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: Text('Select Reset Method !!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black, )),
                            children: [
                              SimpleDialogOption(
                                onPressed: () async {
                                  await checkPhone(context, empcodeController, nameController); /// 본사와 나노의 경우 모바일을 이용한 초기화 진행가능
                                },
                                child: Text('Mobile Authentication',),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/ResetPasswordQuestion'); /// 질문 답변 인증 페이지로 이동
                                },
                                child: Text('Question & Answer Authentication',),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    else
                    {
                      Navigator.pushNamed(context, '/ResetPasswordQuestion'); /// 질문 답변 인증 페이지로 이동
                    }
                  }
                });
              }
              else{
                showMessageBox(context, "Alert", "Not Exists User Data!!!");
              }
            }
          }
          else{
            print("check Employee Error : " + response.statusCode.toString());
          }
        });
      }
      catch (e) {
        print("check Employee Error : " + e.toString());
      }
    }
  }

  /// Reset Password Process
  Future<bool> checkPhone(BuildContext context, TextEditingController empcodeController, TextEditingController nameController) async {
    if(empcodeController.text.isEmpty) { showMessageBox(context, 'Alert', 'Employee Number Not Exists !!!'); }
    else if(nameController.text.isEmpty) { showMessageBox(context, 'Alert', 'Name Not Exists !!!'); }
    else {
      try {

        // Login API Url
        var url = 'https://jhapi.jahwa.co.kr/MCheckPhone';

        // Send Parameter
        var data = {'EmpCode': empcodeController.text, 'Name' : nameController.text};

        return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<bool>((http.Response response) {
          if(response.statusCode != 200 || response.body == null || response.body == "{}" ){ return false; }
          if(response.statusCode == 200) {
            if (response.body.toString() == "하루 5회 전송 제한횟수를 초과했습니다.") {
              showMessageBox(context, "Alert", response.body.toString());
            }
            else {
              var strArray = response.body.toString().split('/');
              showMessageBox(context, "Alert", "[" + strArray[1] + "]로 인증번호가 성공적으로 전송되었습니다.");
              messagenum = strArray[0];
              Future.delayed(Duration(seconds: 3), () {
                Navigator.pushNamed(context, '/ResetPasswordMobile'); /// 휴대폰 인증 페이지로 이동
              });
            }
            return true;
          }
          else{ return false; }
        });
      }
      catch (e) {
        print("reset Password Error : " + e.toString());
        return false;
      }
    }
    return false;
  }
}