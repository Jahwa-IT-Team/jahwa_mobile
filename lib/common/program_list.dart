import 'package:flutter/material.dart';

import 'package:jahwa_mobile/common/check.dart';
import 'package:jahwa_mobile/common/check_employee.dart';
import 'package:jahwa_mobile/common/login.dart';
import 'package:jahwa_mobile/common/reset_password.dart';
import 'package:jahwa_mobile/common/reset_password_mobile.dart';
import 'package:jahwa_mobile/common/reset_password_question.dart';
import 'package:jahwa_mobile/common/reset_password_resno.dart';
import 'package:jahwa_mobile/Program/attendanceinformation.dart';
import 'package:jahwa_mobile/Program/electronicapproval.dart';
import 'package:jahwa_mobile/Program/personalinformationerp.dart';
import 'package:jahwa_mobile/Program/salaryinformation.dart';
import 'package:jahwa_mobile/Program/webmail.dart';
import 'package:jahwa_mobile/index.dart';
import 'package:jahwa_mobile/menu.dart';
import 'package:jahwa_mobile/search.dart';
import 'package:jahwa_mobile/profile.dart';
import 'package:jahwa_mobile/favorite.dart';

final routes = {
  /// Basic Program
  '/' : (BuildContext context) => Check(), /// 기본으로 main -> check -> update, login or index page로 이동
  '/AttendanceInformation' : (BuildContext context) => AttendanceInformation(),
  '/CheckEmployee' : (BuildContext context) => CheckEmployee(),
  '/ElectronicApproval' : (BuildContext context) => ElectronicApproval(),
  '/Favorite' : (BuildContext context) => Favorite(),
  '/Index' : (BuildContext context) => Index(),
  '/Login' : (BuildContext context) => Login(),
  '/Menu' : (BuildContext context) => Menu(),
  '/PersonalInformationERP' : (BuildContext context) => PersonalInformationERP(),
  '/Profile' : (BuildContext context) => Profile(),
  '/ResetPassword' : (BuildContext context) => ResetPassword(),
  '/ResetPasswordMobile' : (BuildContext context) => ResetPasswordMobile(),
  '/ResetPasswordQuestion' : (BuildContext context) => ResetPasswordQuestion(),
  '/ResetPasswordResNo' : (BuildContext context) => ResetPasswordResNo(),
  '/SalaryInformation' : (BuildContext context) => SalaryInformation(),
  '/Search' : (BuildContext context) => Search(),
  '/WebMail' : (BuildContext context) => WebMail(),
};