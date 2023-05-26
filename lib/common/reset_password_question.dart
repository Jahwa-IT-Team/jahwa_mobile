import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

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
    print("open Reset Password using Question Page : " + DateTime.now().toString());
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
        backgroundColor: const Color(0xFFb9d2ff),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 45,
          backgroundColor: const Color(0xFF729ee2),
          elevation: 0.0,
          title:Row(
            children: <Widget> [
              Icon(Icons.help, size: 20, color: Colors.lightGreen),
              Container(padding: EdgeInsets.only(left: 10.0),),
              Text('Reset Password using Question', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
        body: SingleChildScrollView ( /// Scroll이 생기도록 하는 Object
            child: Container(
              height: screenHeight,
              width: screenWidth,
              ///color: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
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
                          Container( /// Input Area
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("1. " + resetpass['question1'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,)),
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
                              labelText: 'Answer 1',
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16,),
                          Container( /// Input Area
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("2. " + resetpass['question2'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,)),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            autofocus: false,
                            controller: answer2Controller,
                            focusNode: answer2FocusNode,
                            keyboardType: TextInputType.text,
                            onSubmitted: (String inputText) async {
                              resetPassword(context, answer1Controller, answer2Controller, passwordController);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              labelText: 'Answer 2',
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 30,),
                          Container( /// Input Area
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            child: Text("Password to change", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,)),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            autofocus: false,
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            focusNode: passwordFocusNode,
                            onSubmitted: (String inputText) async {
                              FocusScope.of(context).unfocus();
                              resetPassword(context, answer1Controller, answer2Controller, passwordController);
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
                                Icon(Icons.drive_file_rename_outline, size: 20),
                                SizedBox(height: 45, width: 20),
                                Text('Reset Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,)),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              resetPassword(context, answer1Controller, answer2Controller, passwordController);
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
  Future<void> resetPassword(BuildContext context, TextEditingController answer1Controller, TextEditingController answer2Controller, TextEditingController passwordController) async {

    FocusScopeNode currentFocus = FocusScope.of(context);
    /*if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }*/

    if(answer1Controller.text.isEmpty) { showMessageBox(context, 'Alert', 'Answer 1 Not Exists !!!'); }
    else if(answer2Controller.text.isEmpty) { showMessageBox(context, 'Alert', 'Answer 2 Not Exists !!!'); }
    else if(passwordController.text.isEmpty) { showMessageBox(context, 'Alert', 'Password Not Exists !!!'); } /// Password Empty Check
    else if(!isPasswordCompliant(passwordController.text)) { showMessageBox(context, 'Alert', 'Password invalid !!!'); } /// Password Validation Check
    else {
      try {

        // Login API Url
        var url = 'https://jhapi.jahwa.co.kr/MResetPassword';

        // Send Parameter
        var data = {'Page': "ResetPassword", 'EmpCode': resetpass['empcode'].toString(), 'Name' : '', 'Password' : passwordController.text, 'Company' : resetpass['company'].toString(), 'Answer1' : answer1Controller.text, 'Answer2' : answer2Controller.text};

        return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
          if(response.statusCode != 200 || response.body == null || response.body == "{}" ){
            showMessageBox(context, "Alert", "Reset Password Error : " + response.body.toString());
          }
          if(response.statusCode == 200) {
            if(response.body.toString().substring(0, 7) == "NOCOUNT") {
              var strArray = response.body.toString().split("_");
              if (strArray.length > 0) {
                if (strArray[1] == "1") showMessageBox(context, "Alert", "Answer Error  : 1차");
                else if (strArray[1] == "2") showMessageBox(context, "Alert", "Answer Error  : 2차");
                else if (strArray[1] == "3") showMessageBox(context, "Alert", "Answer Error  : 3차");
                else showMessageBox(context, "Alert", response.body.toString());
              }
              else showMessageBox(context, "Alert", response.body.toString());
            }
            else if (response.body.toString().substring(0, 4) == "LOCK") {
              var strArray = response.body.toString().split("_");
              if (strArray.length > 0) {
                showMessageBox(context, "Locking", "Your account has been locked due to more than 3 response errors. Please proceed again in 10 minutes.");
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
          else{
            showMessageBox(context, "Alert", "Process Error!!! Please Check API Server!!!");
          }
        });
      }
      catch (e) {
        showMessageBox(context, "Alert", "Reset Password Error : " + e.toString());
      }
    }
  }
}