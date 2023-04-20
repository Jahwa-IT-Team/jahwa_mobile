import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';

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