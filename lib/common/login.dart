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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController empcodeController = new TextEditingController(); /// Employee Number Data Controller
  TextEditingController passwordController = new TextEditingController(); /// Password Data Controller

  FocusNode empcodeFocusNode = FocusNode(); /// Employee Input Number Focus
  FocusNode passwordFocusNode = FocusNode(); /// Password Input Focus

  void initState() {
    super.initState();
    print("open Login Page : " + DateTime.now().toString());
    setEmpCodeController(empcodeController); /// 세션을 이용한 사번 자동 세팅
  }

  @override
  Widget build(BuildContext context) {
/*
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: true,
      progressBgColor: Colors.transparent,
      msg: "Check Upgrade...",
      hideValue: true,
    );
*/
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
        body: SingleChildScrollView ( /// Scroll이 생기도록 하는 Object
            child: Container(
              height: screenHeight,
              width: screenWidth,
              color: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
              child: Column(
                children: <Widget>[
                  SizedBox( height: statusBarHeight, ), /// Status Bar
                  Container( /// Jahwa Mark
                      width: screenWidth,
                      height: (screenHeight - statusBarHeight) * 0.45,
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: baseWidth,
                        child: Image.asset("assets/images/jahwa_mark_m.png"), /// pubspec.yaml의 flutter -> assets 하위에 정의된 파일
                      )
                  ),
                  Container( /// Input Area
                    width: screenWidth,
                    alignment: Alignment.center,
                    child: Container(
                      width: baseWidth,
                      height: (screenHeight - statusBarHeight) * 0.30,
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget> [
                          TextField(
                            autofocus: false,
                            controller: empcodeController,
                            focusNode: empcodeFocusNode,
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
                              labelText: 'Login.Employee Number'.tr(),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16,),
                          TextField(
                            obscureText: true,
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            focusNode: passwordFocusNode,
                            onSubmitted: (String inputText) async {
                              loginCheck(context, empcodeController, passwordController); /// Input Box에서 Enter 적용시 바로 로그인 프로세스가 진행됨
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(10.0),),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              labelText: 'Login.Password'.tr(),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            textInputAction: TextInputAction.done,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () async {
                                Navigator.pushNamed(context, '/CheckEmployee'); /// 사원확인 페이지로 이동
                              },
                              child: Text('Login.Forgot Password?'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14, ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container( /// Login Button
                    width: baseWidth,
                    height: (screenHeight - statusBarHeight) * 0.2,
                    alignment: Alignment.topCenter,
                    child: ButtonTheme(
                      minWidth: baseWidth,
                      child: ElevatedButton(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.solidUser, size: 16),
                            SizedBox(height: 45, width: 20),
                            Text('Login.Login'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,)),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () async {
                          loginCheck(context, empcodeController, passwordController); /// 수동으로 로그인 프로세스를 실행시킴
                        },
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

  /// Login Process
  Future<void> loginCheck(BuildContext context, TextEditingController empcodeController, TextEditingController passwordController) async {

    if(empcodeController.text.isEmpty) { showMessageBox(context, 'Alert', 'Employee Number Not Exists !!!'); } /// Employee Number Empty Check
    else if(passwordController.text.isEmpty) { showMessageBox(context, 'Alert', 'Password Not Exists !!!'); } /// Password Empty Check
    else if(!isPasswordCompliant(passwordController.text)) { showMessageBox(context, 'Alert', 'Password invalid !!!'); } /// Password Validation Check
    else {
      if(await signIn(empcodeController.text, passwordController.text)) {
        empcodeController.clear(); /// Employee Number Clear
        passwordController.clear(); /// Password Clear
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false); /// 로그인 성공시 Check 페이지로 이동
      }
      else {
        showMessageBox(context, 'Alert', 'The login information is incorrect.');
      } /// Login 실패 메시지
    }
  }

  /// 세션을 이용한 사번 자동 세팅
  Future<void> setEmpCodeController(TextEditingController empcodeController) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    empcodeController.text = (prefs.getString('EmpCode') ?? '');
  }

  /// Login Check Process
  Future<bool> signIn(String empcode, String password) async {

    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: true,
      progressBgColor: Colors.transparent,
      msg: "Check User Information...",
      hideValue: true,
    );

    try {

      var url = 'https://jhapi.jahwa.co.kr/MLogin';  /// API Url
      var data = {'id': empcode, 'password' : password}; /// Send Parameter

      return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<bool>((http.Response response) {
        if(response.statusCode != 200 || response.body == null || response.body == "{}" ) {
          pd.close();
          return false;
        }
        if(response.statusCode == 200){
          Map<dynamic, dynamic> table = jsonDecode(response.body);
          Map userMap = table['Table'][0];
          var user = User.fromJson(userMap); /// globals.dart에 정의된 User를 이용해 정보를 Mapping하는 것
          addUserSharedPreferences(user); /// 사용자 정보 세션 생성
          //addPasswordSharedPreferences(password); /// 비밀번호 관련 세션 생성
          pd.close();
          return true;
        }
        else {
          pd.close();
          return false;
        }
      });

      return false;
    } catch (e) {
      print("signIn Error : " + e.toString());

      await Future.delayed(Duration(milliseconds: 500));
      pd.close();

      return false;
    }
  }
}