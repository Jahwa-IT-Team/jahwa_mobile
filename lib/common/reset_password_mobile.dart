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

class ResetPasswordMobile extends StatefulWidget {
  @override
  _ResetPasswordMobileState createState() => _ResetPasswordMobileState();
}

class _ResetPasswordMobileState extends State<ResetPasswordMobile> {

  TextEditingController answer1Controller = new TextEditingController(); /// Employee Number Data Controller
  TextEditingController passwordController = new TextEditingController(); /// Password Data Controller

  FocusNode answer1FocusNode = FocusNode(); /// Employee Number Input Focus
  FocusNode passwordFocusNode = FocusNode(); /// Password Input Focus

  var remain = 300;

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(remain > 0) {
        setState(() {
          remain --;
        });
      }
    });
    print("open Reset Password with Mobile Page : " + DateTime.now().toString());
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
              Text('Reset with Mobile', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
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
                    child: Text('Reset Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black,)),
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
                          TextField(
                            autofocus: false,
                            controller: answer1Controller,
                            focusNode: answer1FocusNode,
                            keyboardType: TextInputType.text,
                            onSubmitted: (String inputText) {
                              FocusScope.of(context).requestFocus(passwordFocusNode);  /// Input Box에서 Enter 적용시 Password 입력 Box로 이동됨
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              labelText: '인증번호 입력',
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16,),
                          Container( /// Input Area
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("남은시간 : " + remain.toString() + "초", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.redAccent,)),
                          ),
                          SizedBox(height: 16,),
                          Container( /// Input Area
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("5분 이내로 인증번호를 입력해 주세요.\n인증번호 전송은 하루 최대 5회이며 문자전송은 최대 1분까지 소요될수 있습니다.", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.blueAccent,)),
                          ),
                          SizedBox(height: 30,),
                          Container( /// Input Area
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("변경 비밀번호", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,)),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            autofocus: false,
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            focusNode: passwordFocusNode,
                            onSubmitted: (String inputText) async {
                              FocusScope.of(context).unfocus();
                              resetPassword(context, answer1Controller, passwordController);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              labelText: 'Password',
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(height: 16,),
                          ElevatedButton(
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.userEdit, size: 16),
                                SizedBox(height: 45, width: 20),
                                Text('Reset Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,)),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              resetPassword(context, answer1Controller, passwordController);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

  /// Reset Password Process
  Future<void> resetPassword(BuildContext context, TextEditingController answer1Controller, TextEditingController passwordController) async {

    if(remain == 0)  { showMessageBox(context, 'Alert', 'The authentication time has expired.'); }
    else if(answer1Controller.text.isEmpty) { showMessageBox(context, 'Alert', 'Answer Not Exists !!!'); }
    else if(messagenum != answer1Controller.text) { showMessageBox(context, 'Alert', 'The authentication number does not match.'); }
    else if(passwordController.text.isEmpty) { showMessageBox(context, 'Alert', 'Password Not Exists !!!'); } /// Password Empty Check
    else if(!isPasswordCompliant(passwordController.text)) { showMessageBox(context, 'Alert', 'Password invalid !!!'); } /// Password Validation Check
    else {
      try {

        // Login API Url
        var url = 'https://jhapi.jahwa.co.kr/MResetPassword';

        // Send Parameter
        var data = {'Page': "ResetPassword3", 'EmpCode': resetpass['empcode'].toString(), 'Name' : '', 'Password' : passwordController.text, 'Company' : resetpass['company'].toString(), 'Answer1' : '', 'Answer2' : ''};

        return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
          if(response.statusCode != 200 || response.body == null || response.body == "{}" ){
            showMessageBox(context, "Alert", "Reset Password Error : " + response.body.toString());
          }
          if(response.statusCode == 200) {
            if (response.body.toString().substring(0, 4) == "LOCK") {
              var strArray = response.body.toString().split("_");
              if (strArray.length > 0) {
                showMessageBox(context, "Locking", "3회이상의 답변 오류 발생으로 인해 계정이 잠겨있습니다. 10분뒤 다시 진행해 주시기 바랍니다.");
              }
              else showMessageBox(context, "Alert", response.body.toString());
            }
            else if (response.body.toString() == "Work Completed") {
              showMessageBox(context, "Alert", response.body.toString());
              Future.delayed(Duration(seconds: 3), () {
                Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);  /// Direct Move to Login
              });
            }
            else if (response.body.toString() == "Use Wrong Text") {
              showMessageBox(context, "Alert", "문제를 발생시킬 문자를 사용하였습니다. 확인후 올바른 문자를 사용하시기 바랍니다.");
            }
            else { showMessageBox(context, "Alert", "Password Not Available, Check Password Rule!!! Can Not Use id and More than 2 Letter of Name in Password!!!"); }
          }
          else{
            showMessageBox(context, "Alert", "Process Error!!! Please Check API Server!!!");
          }
        });
      }
      catch (e) {
        print("reset Password Error : " + e.toString());
        ///return false;
      }
    }
  }
}