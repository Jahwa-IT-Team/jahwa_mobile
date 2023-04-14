import 'package:flutter/material.dart';

import 'package:jahwa_mobile/index.dart';
import 'package:jahwa_mobile/menu.dart';
import 'package:jahwa_mobile/search.dart';
import 'package:jahwa_mobile/profile.dart';
import 'package:jahwa_mobile/favorite.dart';

final routes = {
  /// Basic Program
  '/' : (BuildContext context) => Index(), /// 기본으로 main -> check -> update, login or index page로 이동
  '/Menu' : (BuildContext context) => Menu(),
  '/Search' : (BuildContext context) => Search(),
  '/Profile' : (BuildContext context) => Profile(),
  '/Favorite' : (BuildContext context) => Favorite(),
};