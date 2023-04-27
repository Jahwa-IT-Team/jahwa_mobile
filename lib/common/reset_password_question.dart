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

class ResetPasswordQuestion extends StatefulWidget {
  @override
  _ResetPasswordQuestionState createState() => _ResetPasswordQuestionState();
}

class _ResetPasswordQuestionState extends State<ResetPasswordQuestion> {

  TextEditingController answer1Controller = new TextEditingController(); /// Employee Number Data Controller
  TextEditingController answer2Controller = new TextEditingController(); /// Name Data Controller
  TextEditingController passwordController = new TextEditingController(); /// Password Data Controller

  FocusNode answer1FocusNode = FocusNode(); /// Employee Number Input Focus
  FocusNode answer2FocusNode = FocusNode(); /// Name Input Focus
  FocusNode passwordFocusNode = FocusNode(); /// Password Input Focus

  void initState() {
    super.initState();
    print("open Reset Password with Question Page : " + DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {

    pr = ProgressDialog( /// 1. Progress Dialog Setting
      context,
      type: ProgressDialogType.Normal,
      isDismissible: true,
    );

    pr.style( /// 2. Progress Dialog Style
      message: translateText(context, 'Wait a Moment...'),
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600),
    );

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
          backgroundColor: Color.fromARGB(0xFF, 0x34, 0x40, 0x4E),
          title: Text("Reset with Question",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15,),
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
                    child: Text(translateText(context, 'Reset Password'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black,)),
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
                          Container( /// Input Area
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("1. " + resetpass['Table'][0]['question1'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,)),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            autofocus: false,
                            controller: answer1Controller,
                            focusNode: answer1FocusNode,
                            keyboardType: TextInputType.text,
                            onSubmitted: (String inputText) {
                              FocusScope.of(context).requestFocus(answer2FocusNode);  /// Input Box에서 Enter 적용시 Password 입력 Box로 이동됨
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              labelText: translateText(context, '답변 1'),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16,),
                          Container( /// Input Area
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("2. " + resetpass['Table'][0]['question2'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,)),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            autofocus: false,
                            controller: answer2Controller,
                            focusNode: answer2FocusNode,
                            keyboardType: TextInputType.text,
                            onSubmitted: (String inputText) async {
                              await pr.show(); /// 3. Progress Dialog Show - Need Declaration, Setting, Style
                              resetPassword(context, answer1Controller, answer2Controller, passwordController, pr);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              labelText: translateText(context, '답변 2'),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.next,
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
                              await pr.show(); /// Progress Dialog Show - Need Declaration, Setting, Style
                              resetPassword(context, answer1Controller, answer2Controller, passwordController, pr);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              labelText: translateText(context, 'Password'),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(height: 16,),
                          ButtonTheme(
                            minWidth: baseWidth,
                            height: 50.0,
                            child: RaisedButton(
                              child:Text(translateText(context, 'Reset Password'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,)),
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                              splashColor: Colors.grey,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                await pr.show(); /// 3. Progress Dialog Show - Need Declaration, Setting, Style
                                resetPassword(context, answer1Controller, answer2Controller, passwordController, pr);
                              },
                            ),
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

  /// Password Validation Check
  bool isPasswordCompliant(String password, [int minLength = 6, int maxLength = 21]) {
    if (password == null || password.isEmpty) { return false; } /// Password Null Check

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]')); /// Upper Case Character Check
    bool hasLowercase = password.contains(new RegExp(r'[a-z]')); /// Lower Case Character Check
    bool hasDigits = password.contains(new RegExp(r'[0-9]')); /// Number Check
    bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#<>/?":_`~;[\]{}\\|=+)(*&^%\s-]')); /// Special Character Check, 특수문자 제한관련 확인 필요
    bool hasMinLength = password.length > minLength; /// Min Over 6
    bool hasMaxLength = password.length < maxLength; /// Max Under 21

    return hasDigits & (hasUppercase || hasLowercase) & hasSpecialCharacters & hasMinLength & hasMaxLength;
  }

  /// Reset Password Process
  Future<void> resetPassword(BuildContext context, TextEditingController answer1Controller, TextEditingController answer2Controller, TextEditingController passwordController, ProgressDialog pr) async {

    pr.hide(); /// 4. Progress Dialog Close

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }

    if(answer1Controller.text.isEmpty) { showMessageBox(context, 'Alert', 'Answer 1 Not Exists !!!'); }
    else if(answer2Controller.text.isEmpty) { showMessageBox(context, 'Alert', 'Answer 2 Not Exists !!!'); }
    else if(passwordController.text.isEmpty) { showMessageBox(context, 'Alert', 'Password Not Exists !!!'); } /// Password Empty Check
    else if(!isPasswordCompliant(passwordController.text)) { showMessageBox(context, 'Alert', 'Password invalid !!!'); } /// Password Validation Check
    else {
      try {

        // Login API Url
        var url = 'https://jhapi.jahwa.co.kr/ResetPassword';

        // Send Parameter
        var data = {'Page': "ResetPassword", 'EmpCode': resetpass['Table'][0]['empcode'].toString(), 'Name' : '', 'Password' : passwordController.text, 'Company' : resetpass['Table'][0]['company'].toString(), 'Answer1' : answer1Controller.text, 'Answer2' : answer2Controller.text};

        return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<bool>((http.Response response) {
          if(response.statusCode != 200 || response.body == null || response.body == "{}" ){ return false; }
          if(response.statusCode == 200) {
            if(response.body.toString().substring(0, 7) == "NOCOUNT") {
              var strArray = response.body.toString().split("_");
              if (strArray.length > 0) {
                if (strArray[1] == "1") showMessageBox(context, "Alert", "답변 오류  : 1차");
                else if (strArray[1] == "2") showMessageBox(context, "Alert", "답변 오류  : 2차");
                else if (strArray[1] == "3") showMessageBox(context, "Alert", "답변 오류  : 3차");
                else showMessageBox(context, "Alert", response.body.toString());
              }
              else showMessageBox(context, "Alert", response.body.toString());
            }
            else if (response.body.toString().substring(0, 4) == "LOCK") {
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
            else { showMessageBox(context, "Alert", "Password Not Available, Check Password Rule!!! Can Not Use id and More than 2 Letter of Name in Password!!!"); }
          }
          else{ return false; }
        });
      }
      catch (e) {
        print("reset Password Error : " + e.toString());
        return false;
      }
    }
  }
}