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

import 'package:jahwa_mobile/common/function.dart';
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
                  Container( /// Language Select
                    width: screenWidth,
                    height: (screenHeight - statusBarHeight) * 0.1,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0) ,
                    child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.language),
                        iconSize: 40,
                        color: Colors.blueAccent,
                        onPressed: () {
                          ;
                        }
                    ),
                  ),
                  Container( /// Jahwa Mark
                      width: screenWidth,
                      height: (screenHeight - statusBarHeight) * 0.35,
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
                      height: (screenHeight - statusBarHeight) * 0.35,
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
                              ///ng, Style
                              ///loginCheck(context, empcodeController, passwordController, pr); /// Input Box에서 Enter 적용시 바로 로그인 프로세스가 진행됨
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
                          /*Container(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () async {
                                if(await getSelectList('Company')) Navigator.pushNamed(context, '/CheckEmployee'); /// 사원확인 페이지로 이동
                              },
                              child: Text(
                                translateText(context, 'Forgot Password?'),
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14, ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                  /*Container( /// Login Button
                    width: screenWidth,
                    height: (screenHeight - statusBarHeight) * 0.2,
                    alignment: Alignment.topCenter,
                    child: ButtonTheme(
                      minWidth: baseWidth,
                      height: 50.0,
                      child: RaisedButton(
                        child:Text(translateText(context, 'Login'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,)),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                        splashColor: Colors.grey,
                        onPressed: () async {
                          await pr.show(); /// 3. Progress Dialog Show - Need Declaration, Setting, Style
                          loginCheck(context, empcodeController, passwordController, pr); /// 수동으로 로그인 프로세스를 실행시킴
                        },
                      ),
                    ),
                  ),*/
                ],
              ),
            )
        ),
      ),
    );
  }

  /// Add User SharedPreferences
  Future<void> addPasswordSharedPreferences(var password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ///try { prefs.setString('Password', encryptText('Encrypt', password)); }
    ///catch (e) { print(e.toString()); }
  }

  /// Add User SharedPreferences
  Future<void> addUserSharedPreferences(var user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); /// Cookie 대용

    var today = DateTime.now();
    var oneWeekFromNow = today.add(const Duration(days: 7));

    try {
      prefs.setString('EntCode', user.EntCode);
      prefs.setString('EntName', user.EntName);
      prefs.setString('DeptCode', user.DeptCode);
      prefs.setString('DeptName', user.DeptName);
      prefs.setString('EmpCode', user.EmpCode);
      prefs.setString('Name', user.Name);
      prefs.setString('RollPstn', user.RollPstn);
      prefs.setString('Position', user.Position);
      prefs.setString('Role', user.Role);
      prefs.setString('Title', user.Title);
      prefs.setString('PayGrade', user.PayGrade);
      prefs.setString('Level', user.Level);
      prefs.setString('Email', user.Email);
      prefs.setString('Photo', user.Photo);
      prefs.setInt('Auth', user.Auth);
      prefs.setString('EntGroup', user.EntGroup);
      prefs.setString('OfficeTel', user.OfficeTel);
      prefs.setString('Mobile', user.Mobile);
      prefs.setString('DueDate', DateFormat('yyyy-MM-dd').format(oneWeekFromNow));
      ///prefs.setString('Language', language);
      prefs.setString('Token', user.Token);

      /// common.dart에 정의된 session 정보
      session['EntCode'] =  user.EntCode;
      session['EntName'] = user.EntName;
      session['DeptCode'] = user.DeptCode;
      session['DeptName'] = user.DeptName;
      session['EmpCode'] = user.EmpCode;
      session['Name'] = user.Name;
      session['RollPstn'] = user.RollPstn;
      session['Position'] = user.Position;
      session['Role'] = user.Role;
      session['Title'] = user.Title;
      session['PayGrade'] = user.PayGrade;
      session['Level'] = user.Level;
      session['Email'] = user.Email;
      session['Photo'] = user.Photo;
      session['Auth'] = user.Auth.toString();
      session['EntGroup'] = user.EntGroup;
      session['OfficeTel'] = user.OfficeTel;
      session['Mobile'] = user.Mobile;
      session['DueDate'] = DateFormat('yyyy-MM-dd').format(oneWeekFromNow);
      session['Token'] = user.Token;
    }
    catch (e) { print(e.toString()); }
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
  Future<void> loginCheck(BuildContext context, TextEditingController empcodeController, TextEditingController passwordController, ProgressDialog pr) async {

    ///pr.hide(); /// 4. Progress Dialog Close
/*
    if(empcodeController.text.isEmpty) { showMessageBox(context, 'Alert', 'Employee Number Not Exists !!!'); } /// Employee Number Empty Check
    else if(passwordController.text.isEmpty) { showMessageBox(context, 'Alert', 'Password Not Exists !!!'); } /// Password Empty Check
    else if(!isPasswordCompliant(passwordController.text)) { showMessageBox(context, 'Alert', 'Password invalid !!!'); } /// Password Validation Check
    else {
      if(await signIn(empcodeController.text, passwordController.text)) {
        empcodeController.clear(); /// Employee Number Clear
        passwordController.clear(); /// Password Clear
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false); /// 로그인 성공시 Check 페이지로 이동
      }
      else { showMessageBox(context, 'Alert', 'The login information is incorrect.'); } /// Login 실패 메시지
    }*/
  }

  /// 세션을 이용한 사번 자동 세팅
  Future<void> setEmpCodeController(TextEditingController empcodeController) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    empcodeController.text = (prefs.getString('EmpCode') ?? '');
  }

  /// Login Check Process
  Future<bool> signIn(String email, String password) async {
    try {

      var url = 'https://jhapi.jahwa.co.kr/Login';  /// API Url
      var data = {'id': email, 'password' : password}; /// Send Parameter

      return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<bool>((http.Response response) {
        if(response.statusCode != 200 || response.body == null || response.body == "{}" ) { return false; }
        if(response.statusCode == 200){
          Map<String, dynamic> table = jsonDecode(response.body);
          Map userMap = table['Table'][0];
          var user = User.fromJson(userMap); /// globals.dart에 정의된 User를 이용해 정보를 Mapping하는 것
          addUserSharedPreferences(user); /// 사용자 정보 세션 생성
          addPasswordSharedPreferences(password); /// 비밀번호 관련 세션 생성
          return true;
        }
        else { return false; }
      });
    } catch (e) {
      print("signIn Error : " + e.toString());
      return false;
    }
  }
}