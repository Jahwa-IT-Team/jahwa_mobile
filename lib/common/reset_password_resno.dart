import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class ResetPasswordResNo extends StatefulWidget {
  @override
  _ResetPasswordResNoState createState() => _ResetPasswordResNoState();
}

class _ResetPasswordResNoState extends State<ResetPasswordResNo> {

  TextEditingController resnoController = new TextEditingController(); /// Name Data Controller
  TextEditingController passwordController = new TextEditingController(); /// Password Data Controller

  FocusNode resnoFocusNode = FocusNode(); /// Name Input Focus
  FocusNode passwordFocusNode = FocusNode(); /// Password Input Focus

  void initState() {
    super.initState();
    print(resetpass['empcode'].toString());
    print("open Reset Password Page : " + DateTime.now().toString());
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
              Icon(Icons.how_to_reg, size: 20, color: Colors.lightGreen),
              Container(padding: EdgeInsets.only(left: 10.0),),
              Text('Reset Password.Reset Password using Regist Number'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
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
                    child: Text('Reset Password.Reset Password'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black,)),
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
                            controller: resnoController,
                            focusNode: resnoFocusNode,
                            keyboardType: TextInputType.text,
                            onSubmitted: (String inputText) async {
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
                              labelText: 'Reset Password.Registration Number'.tr(),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16,),
                          TextField(
                            autofocus: false,
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            focusNode: passwordFocusNode,
                            onSubmitted: (String inputText) async {
                              resetPassword(context, resnoController, passwordController); /// Input Box에서 Enter 적용시 바로 로그인 프로세스가 진행됨
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              labelText: 'Reset Password.New Password'.tr(),
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
                                Text('Reset Password.Reset Password'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,)),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              resetPassword(context, resnoController, passwordController);
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
  Future<void> resetPassword(BuildContext context, TextEditingController resnoController, TextEditingController passwordController) async {

    if(resetpass['empcode'].toString().isEmpty || resnoController.text.isEmpty) { showMessageBox(context, 'Message.Alert'.tr(), 'Message.Employee Number or Name Not Exists !!!'.tr()); } /// Employee Number and Name Empty Check
    else {
      try {

        // Login API Url
        var url = 'https://jhapi.jahwa.co.kr/MResetPassword';

        // Send Parameter
        var data = {'Page' : "ResetPassword2", 'EmpCode': resetpass['empcode'].toString(), 'Name' : '', 'Password' : passwordController.text, 'Company' : '', 'Answer1' : resnoController.text, 'Answer2' : ''};

        return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
          if(response.statusCode != 200 || response.body == "{}" ){
            showMessageBox(context, "Message.Alert".tr(), "Message.Reset Password Error".tr() + " : " + response.body.toString());
          }
          if(response.statusCode == 200) {
            showMessageBox(context, "", response.body.toString());
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);  /// Direct Move to Login
            });
          }
          else{
            showMessageBox(context, "Message.Alert".tr(), "Message.Process Error!!! Please Check API Server!!!".tr());
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