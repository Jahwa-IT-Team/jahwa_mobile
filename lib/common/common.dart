import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jahwa_mobile/common/bubble_bottom_bar.dart';
import 'package:jahwa_mobile/common/variable.dart';

/// Clear Session Function
clearSession() {
  try {
    session['EntCode'] =  '';
    session['EntName'] = '';
    session['DeptCode'] = '';
    session['DeptName'] = '';
    session['EmpCode'] = '';
    session['Name'] = '';
    session['RollPstn'] = '';
    session['Position'] = '';
    session['Role'] = '';
    session['Title'] = '';
    session['PayGrade'] = '';
    session['Level'] = '';
    session['Email'] = '';
    session['Photo'] = '';
    session['Auth'] = '0';
    session['EntGroup'] = '';
    session['OfficeTel'] = '';
    session['Mobile'] = '';
    session['DueDate'] = '';
    session['Token'] = '';
  }
  catch (e) { print(e.toString()); }
}

/// Remove User SharedPreferences
Future<void> removeUserSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('DueDate');
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
    prefs.setString('Route', user.Route);

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
    session['Route'] = user.Route;
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