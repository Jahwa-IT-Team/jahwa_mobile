import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:jahwa_mobile/common/bubble_bottom_bar.dart';
import 'package:jahwa_mobile/common/variable.dart';

/// Add User SharedPreferences
Future<void> addUserSharedPreferences(var user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance(); /// Cookie 대용

  var today = DateTime.now();
  var oneWeekFromNow = today.add(const Duration(days: 7));

  try {
    prefs.setString('OrgEntCode', user.EntCode);
    prefs.setString('OrgDeptCode', user.DeptCode);
    prefs.setString('OrgEmpCode', user.EmpCode);
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
    ///prefs.setString('Language', 'ko-KR');
    prefs.setString('Token', user.Token);
    prefs.setString('Route', user.Route);

    /// common.dart에 정의된 session 정보
    session['OrgEntCode'] =  user.EntCode;
    session['OrgDeptCode'] = user.DeptCode;
    session['OrgEmpCode'] = user.EmpCode;
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
    ///session['Language'] = 'ko-KR';
    session['Token'] = user.Token;
    session['Route'] = user.Route;
  }
  catch (e) { print(e.toString()); }
}

/// Add User SharedPreferences
Future<void> removeUserSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance(); /// Cookie 대용

  try {
    prefs.setString('OrgEntCode', '');
    prefs.setString('OrgDeptCode', '');
    ///prefs.setString('OrgEmpCode', '');
    prefs.setString('EntCode', '');
    prefs.setString('EntName', '');
    prefs.setString('DeptCode', '');
    prefs.setString('DeptName', '');
    prefs.setString('EmpCode', '');
    prefs.setString('Name', '');
    prefs.setString('RollPstn', '');
    prefs.setString('Position', '');
    prefs.setString('Role', '');
    prefs.setString('Title', '');
    prefs.setString('PayGrade', '');
    prefs.setString('Level', '');
    prefs.setString('Email', '');
    prefs.setString('Photo', '');
    prefs.setInt('Auth', 0);
    prefs.setString('EntGroup', '');
    prefs.setString('OfficeTel', '');
    prefs.setString('Mobile', '');
    prefs.setString('DueDate', '');
    ///prefs.setString('Language', 'ko-KR');
    prefs.setString('Token', '');
    prefs.setString('Route', '');

    session.clear();
  }
  catch (e) { print(e.toString()); }
}

setLanguage(BuildContext context) {
  context.setLocale(Locale(session['Language'].toString().split('-')[0], session['Language'].toString().split('-')[1]));
}

Widget setBottomNavigator(BuildContext context) {
  return BubbleBottomBar(
    iconSize: 18,
    backgroundColor: const Color(0xFFC8DEFF),
    hasNotch: true,
    fabLocation: BubbleBottomBarFabLocation.end,
    opacity: .8,
    currentIndex: currentIndex,
    onTap: (int? index) {
      currentIndex = index!;
      if(currentIndex == 0) Navigator.pushReplacementNamed(context, '/Index');
      else if(currentIndex == 1) Navigator.pushReplacementNamed(context, '/Menu');
      else if(currentIndex == 2) Navigator.pushReplacementNamed(context, '/Search');
      else if(currentIndex == 3) Navigator.pushReplacementNamed(context, '/Profile');
    },
    //borderRadius: BorderRadius.all(Radius.circular(10)), //border radius doesn't work when the notch is enabled.
    elevation: 20,
    tilesPadding: EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 8,
    ),
    items: <BubbleBottomBarItem>[
      BubbleBottomBarItem(
          backgroundColor: const Color(0xFF729ee2),
          icon: Icon(Icons.home, color: const Color(0xFF729ee2)),
          activeIcon: Icon(Icons.home, color: Colors.white),
          title: Text('Home', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))
      ),
      BubbleBottomBarItem(
          backgroundColor: const Color(0xFF729ee2),
          icon: Icon(Icons.apps, color: const Color(0xFF729ee2)),
          activeIcon: Icon(Icons.apps, color: Colors.white),
          title: Text('Menu', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))
      ),
      BubbleBottomBarItem(
          backgroundColor: const Color(0xFF729ee2),
          icon: Icon(Icons.search, color: const Color(0xFF729ee2)),
          activeIcon: Icon(Icons.search, color: Colors.white),
          title: Text('Search', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))
      ),
      BubbleBottomBarItem(
          backgroundColor: const Color(0xFF729ee2),
          icon: Icon(Icons.person, color: const Color(0xFF729ee2)),
          activeIcon: Icon(Icons.person, color: Colors.white),
          title: Text('Profile', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))
      ),
    ],
  );
}

/// Encrypt Text Function
String encryptText(String methood, var data) {
  String returnData = '';
  String keydata = DateFormat('yyyyMMdd').format(DateTime.now());
  keydata = keydata + keydata + keydata + keydata;

  final key = encrypt.Key.fromUtf8(keydata);
  final iv = encrypt.IV.fromLength(16);

  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  if(methood == "Encrypt") returnData = encrypter.encrypt(data, iv: iv).base64;
  else returnData = encrypter.decrypt64(data, iv: iv);

  return returnData;
}

/// Show Confirm Message Box Function
showConfirmMessageBox(BuildContext context, String message, String div, String args) {
  /// set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel", style: TextStyle(fontFamily: "Malgun", color: Colors.blueAccent,),),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget continueButton = TextButton(
    child: Text("Continue", style: TextStyle(fontFamily: "Malgun", color: Colors.blueAccent,),
    ),
    onPressed:  () {
      Navigator.of(context).pop();
      /// By div call each Function, args has many argument data Join by '♭', Level 2 Join by '♪', Level 3 Join by '♬'
      /// String으로 Function Name을 호출하는 방법을 몰라 현재로서는 각개별로 생성 필요
      if(div == "") { showMessageBox(context, 'Alert', "Test Message Box"); }
    },
  );

  /// set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm"),
    content: Text(message),
    titleTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black, fontWeight: FontWeight.bold,),
    contentTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black,),
    actions: [ cancelButton, continueButton, ],
  );

  /// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) { return alert; },
  );
}

/// Show Message Box Function
showMessageBox(BuildContext context, String title, String message) {
  /// set up the button
  Widget okButton = TextButton(
    child: Text("Okay", style: TextStyle(fontFamily: "Malgun", color: Colors.blueAccent,), ),
    onPressed: () {Navigator.of(context).pop();},
  );

  /// set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    titleTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black, fontWeight: FontWeight.bold,),
    contentTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black,),
    actions: [ okButton, ],
  );

  /// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) { return alert; },
  );
}

/// Show Select Message Box Function
showSelectMessageBox(BuildContext context, String message, String buttonname, String div, String args) {
  /// set up the buttons
  Widget aButton = TextButton(
    child: Text(buttonname.split('♭')[0]), // Button Name Join by '♭'
    onPressed:  () {
      Navigator.of(context).pop();
      /// By div call each Function, args has many argument data Join by '♭', Level 2 Join by '♪', Level 3 Join by '♬'
      /// String으로 Function Name을 호출하는 방법을 몰라 현재로서는 각개별로 생성 필요
      if(div == "") { showMessageBox(context, 'Alert', "Test Message Box"); }
    },
  );
  Widget cancelButton = TextButton(
    child: Text("Cancel", style: TextStyle(fontFamily: "Malgun", color: Colors.blueAccent,),),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget bButton = TextButton(
    child: Text(buttonname.split('♭')[1], style: TextStyle(fontFamily: "Malgun", color: Colors.blueAccent,),), /// Button Name Join by '♭'
    onPressed:  () {
      Navigator.of(context).pop();
      /// By div call each Function, args has many argument data Join by '♭', Level 2 Join by '♪', Level 3 Join by '♬'
      /// String으로 Function Name을 호출하는 방법을 몰라 현재로서는 각개별로 생성 필요
      if(div == "") { showMessageBox(context, 'Alert', "Test Message Box"); }
    },
  );

  /// set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notice"),
    content: Text(message),
    titleTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black, fontWeight: FontWeight.bold,),
    contentTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black,),
    actions: [
      aButton,
      cancelButton,
      bButton,
    ],
  );

  /// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) { return alert; },
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

/// Show Language Select Box Function
showLanaguageBox(BuildContext context) {
  Widget enUSButton = TextButton(
    child: Text('English'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14, )),
    onPressed:  () {
      session['Language'] = 'en-US';
      setLanguage(context);
      Navigator.of(context).pop();
    },
  );
  Widget koKRButton = TextButton(
    child: Text('한국어'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14, )),
    onPressed:  () {
      session['Language'] = 'ko-KR';
      setLanguage(context);
      Navigator.of(context).pop();
    },
  );
  Widget viVNButton = TextButton(
    child: Text('Tiếng Việt'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14, )),
    onPressed:  () {
      session['Language'] = 'vi-VN';
      setLanguage(context);
      Navigator.of(context).pop();
    },
  );
  Widget zhCNButton = TextButton(
    child: Text('中国话'.tr(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14, )),
    onPressed:  () {
      session['Language'] = 'zh-CN';
      setLanguage(context);
      Navigator.of(context).pop();
    },
  );

  /// set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text('Select Language'.tr()),
    titlePadding: const EdgeInsets.all(50),
    ///content: Text(message),
    titleTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,),
    ///contentTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black,),
    actions: [ enUSButton, koKRButton, viVNButton, zhCNButton, ],
    actionsPadding: const EdgeInsets.only(top:0, right:50.0, bottom:50,),
  );

  /// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) { return alert; },
  );
}

/// Show Language Select Box Function
Future<void> showAdditionalBox(BuildContext context) async {
  List<Widget> itemsList = [];

  // Login API Url
  var url = 'https://jhapi.jahwa.co.kr/MAdditionalInformation';

  // Send Parameter
  var data = {'EmpCode' : session['EmpCode']};

  await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
    if(response.statusCode != 200 || response.body == null || response.body == "{}" ){ ; }
    if(response.statusCode == 200){
      if(jsonDecode(response.body)['Table'].length != 0) {
        jsonDecode(response.body)['Table'].forEach((element) {
          Widget textButton = TextButton(
            child: Container (
              width: MediaQuery.of(context).size.width,
              child: Column (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(element['EntName'].toString() + ' - ' + element['DeptName'].toString(),
                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12,),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 5,),
                  Text(element['Name'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14,),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            onPressed:  () async {
              await setUser(context, element['EntCode'].toString(), element['DeptCode'].toString(), element['EmpCode'].toString(), session['OrgEmpCode'].toString(), session['Token'].toString());
              Navigator.of(context).pop();
            },
          );
          itemsList.add(textButton);
        });
      }
    }
    else{ ; }
  });

  /// set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text('Select User'.tr()),
    titlePadding: const EdgeInsets.only(top:50, left: 50, bottom: 30,),
    titleTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,),
    ///contentTextStyle: TextStyle(fontFamily: "Malgun", color: Colors.black,),
    actions: [ for(var item in itemsList ) item ],
    actionsPadding: const EdgeInsets.only(top:0, left: 50, right:30, bottom:50,),
    ///actionsAlignment: MainAxisAlignment.start,
  );

  /// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) { return alert; },
  );
}

/// Login Check Process
Future<void> setUser(BuildContext context, String entcode, String deptcode, String empcode, String orgempcode, String token) async {

  SharedPreferences prefs = await SharedPreferences.getInstance(); /// Cookie 대용

  ProgressDialog pd = ProgressDialog(context: context);
  pd.show(
    barrierDismissible: true,
    progressBgColor: Colors.transparent,
    msg: "Check User Information...",
    hideValue: true,
  );

  try {

    var url = 'https://jhapi.jahwa.co.kr/MSetUser';  /// API Url
    var data = {'EntCode': entcode, 'DeptCode': deptcode, 'EmpCode': empcode, 'OrgEmpCode': orgempcode, 'Token': token}; /// Send Parameter

    await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 15)).then<void>((http.Response response) {
      if(response.statusCode != 200 || response.body == null || response.body == "{}" ) {
        pd.close();
      }
      if(response.statusCode == 200){
        Map<dynamic, dynamic> table = jsonDecode(response.body);
        Map userMap = table['Table'][0];
        var user = User.fromJson(userMap); /// globals.dart에 정의된 User를 이용해 정보를 Mapping하는 것

        var today = DateTime.now();
        var oneWeekFromNow = today.add(const Duration(days: 7));

        try {
          ///prefs.setString('OrgEntCode', user.EntCode);
          ///prefs.setString('OrgDeptCode', user.DeptCode);
          ///prefs.setString('OrgEmpCode', user.EmpCode);
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
          ///prefs.setString('Language', 'ko-KR');
          ///prefs.setString('Token', user.Token);
          prefs.setString('Route', user.Route);

          /// common.dart에 정의된 session 정보
          ///session['OrgEntCode'] =  user.EntCode;
          ///session['OrgDeptCode'] = user.DeptCode;
          ///session['OrgEmpCode'] = user.EmpCode;
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
          ///session['Language'] = 'ko-KR';
          ///session['Token'] = user.Token;
          session['Route'] = user.Route;
        }
        catch (e) { print(e.toString()); }
        pd.close();
      }
      else {
        pd.close();
      }
    });

  } catch (e) {
    print("set User Error : " + e.toString());

    await Future.delayed(Duration(milliseconds: 500));
    pd.close();
  }
}