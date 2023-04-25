import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:update_checker/update_checker.dart';

import 'package:jahwa_mobile/common/common.dart';
import 'package:jahwa_mobile/common/variable.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {

  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      preferenceSetting(); /// Check Upgrade & Session Data
    });
  }

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width; // Screen Width
    screenHeight = MediaQuery.of(context).size.height; // Screen Height
    statusBarHeight = MediaQuery.of(context).padding.top;

    var baseWidth = screenWidth * 0.65;
    if(baseWidth > 280) baseWidth = 280;

    return Scaffold(
      body: SingleChildScrollView ( // this will make your body scrollable
        child: Container( /// 회사 마크
          width: screenWidth,
          height: (screenHeight - statusBarHeight) * 0.65,
          alignment: Alignment.center,
          child: SizedBox(
            width: baseWidth,
            child: Image.asset("assets/images/jahwa_mark_m.png"),
          )
        ),
      ),
    );
  }

  Future<void> preferenceSetting() async {
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: true,
      progressBgColor: Colors.transparent,
      msg: "Check Upgrade...",
      hideValue: true,
    );

    /// 0. Update Check
    var checker = UpdateChecker(); // create an object from UpdateChecker

    /*
    if (Platform.isIOS) {
      checker.checkForUpdates("YOUR_APP_STORE_URL").then((value) => {
        // if value is true you can show a dialog to redirect user to app store to perform update
      });
    }
    else if (Platform.isAndroid) {
      checker
          .checkForUpdates("YOUR_PLAY_STORE_URL", )
          .then((value) => { ; });
    }
    */

    /// 1. Login Check
    await Future.delayed(Duration(milliseconds: 500));
    pd.update(msg: "Check Session...");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// 2. Session Check
    if(await checkLogin())
    {
      /// If need Login, Go to Login Page
      await Future.delayed(Duration(milliseconds: 500));
      pd.close();

      print("Go to Login");
      Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
    }
    else {
      session['EntCode'] = prefs.getString('EntCode') ?? '';
      session['EntName'] = prefs.getString('EntName') ?? '';
      session['DeptCode'] = prefs.getString('DeptCode') ?? '';
      session['DeptName'] = prefs.getString('DeptName') ?? '';
      session['EmpCode'] = prefs.getString('EmpCode') ?? '';
      session['Name'] = prefs.getString('Name') ?? '';
      session['RollPstn'] = prefs.getString('RollPstn') ?? '';
      session['Position'] = prefs.getString('Position') ?? '';
      session['Role'] = prefs.getString('Role') ?? '';
      session['Title'] = prefs.getString('Title') ?? '';
      session['PayGrade'] = prefs.getString('PayGrade') ?? '';
      session['Level'] = prefs.getString('Level') ?? '';
      session['Email'] = prefs.getString('Email') ?? '';
      session['Photo'] = prefs.getString('Photo') ?? '';
      session['Auth'] = prefs.getInt('Auth').toString() ?? '0';
      session['EntGroup'] = prefs.getString('EntGroup') ?? '';
      session['OfficeTel'] = prefs.getString('OfficeTel') ?? '';
      session['Mobile'] = prefs.getString('Mobile') ?? '';
      session['DueDate'] = prefs.getString('DueDate') ?? '';
      session['Token'] = prefs.getString('Token') ?? '';
      session['Route'] = prefs.getString('Route') ?? '';

      await Future.delayed(Duration(milliseconds: 500));
      pd.close();

      print("Go to Index");
      Navigator.pushReplacementNamed(context, '/Index'); /// Move to First Page
    }
  }

  /// Check Login Info -> Move to Login Or Main Page : Index Page Use
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var EmpCode = prefs.getString('EmpCode');
    var Token = prefs.getString('Token');

    /// Send to Token and check valuable.
    if(prefs.getString('Token') == "" ) {
      return true;
    }
    else {
      try {

        var url = 'https://jhapi.jahwa.co.kr/MLoginCheck';  /// API Url
        var data = {'EmpCode': EmpCode, 'Token' : Token}; /// Send Parameter

        return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<bool>((http.Response response) {
          if(response.statusCode != 200 || response.body == null || response.body == "{}" || response.body == "{\"Table\":[]}" ) { return true; }
          if(response.statusCode == 200){
            Map<dynamic, dynamic> table = jsonDecode(response.body);
            Map userMap = table['Table'][0];
            var user = User.fromJson(userMap); /// globals.dart에 정의된 User를 이용해 정보를 Mapping하는 것
            addUserSharedPreferences(user); /// 사용자 정보 세션 생성
            ///addPasswordSharedPreferences(password); /// 비밀번호 관련 세션 생성
            return false;
          }
          else { return true; }
        });
      } catch (e) {
        print("signIn Error : " + e.toString());
        return true;
      }
      return false;
    }
  }


}