import 'package:flutter/material.dart';

import 'package:jahwa_mobile/index.dart';
import 'package:jahwa_mobile/font_list.dart';

final routes = {
/// Basic Program
'/' : (BuildContext context) => Index(), /// 기본으로 main -> check -> update, login or index page로 이동
'/FontList' : (BuildContext context) => FontList(), /// Android Update Apk Download Page로 이동, IOS 미지원
};