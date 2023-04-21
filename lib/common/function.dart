import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
    onTap: changePage(context),
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

changePage(context) {
  ///setState(() {
    ///currentIndex = index!;
    if(currentIndex == 0) Navigator.pushReplacementNamed(context, '/');
    else if(currentIndex == 1) Navigator.pushReplacementNamed(context, '/Menu');
    else if(currentIndex == 2) Navigator.pushReplacementNamed(context, '/Search');
    else if(currentIndex == 3) Navigator.pushReplacementNamed(context, '/Profile');
  ///});
}