import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:update_checker/update_checker.dart';

import 'package:jahwa_mobile/Common/variable.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {

  void initState() {
    super.initState();

    print('Title'.tr());

    var checker = UpdateChecker(); // create an object from UpdateChecker

    Timer(Duration(seconds: 1), () {
      preferenceSetting(); /// Make Session And Language Data, Check Login
    });

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
  }

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width; // Screen Width
    screenHeight = MediaQuery.of(context).size.height; // Screen Height
    statusBarHeight = MediaQuery.of(context).padding.top;

    var baseWidth = screenWidth * 0.65;
    if(baseWidth > 280) baseWidth = 280;

    return Scaffold(
      backgroundColor: const Color(0xFFb9d2ff),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 45,
        backgroundColor: const Color(0xFF729ee2),
        elevation: 0.0,
        title:Row(
          children: <Widget> [
            Icon(FontAwesomeIcons.tasks, size: bSize, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Update Check', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body: Container(
        child : SingleChildScrollView ( // this will make your body scrollable
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container( /// 회사 마크
                    width: screenWidth,
                    height: (screenHeight - statusBarHeight) * 0.40,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: baseWidth,
                      child: Image.asset("assets/images/jahwa_mark_m.png"),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> preferenceSetting() async {
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: true,
      msg: "Please waiting...",
      hideValue: true,
    );

    /// 0. Update Check
    /// 1. Login Check

    /** You can update the message value after a certain action **/
    await Future.delayed(Duration(milliseconds: 1000));
    pd.update(msg: "Almost done...");

    await Future.delayed(Duration(milliseconds: 1000));
    pd.close();

    Navigator.pushReplacementNamed(context, '/Login');
  }
}