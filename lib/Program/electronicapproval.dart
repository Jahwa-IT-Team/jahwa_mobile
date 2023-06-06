import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:jahwa_mobile/common/variable.dart';

final Uri _url = Uri.parse('https://gw.jahwa.co.kr/Mobile/ESign/');

class ElectronicApproval extends StatefulWidget {
  @override
  _ElectronicApprovalState createState() => _ElectronicApprovalState();
}

class _ElectronicApprovalState extends State<ElectronicApproval> {

  void initState() {
    // TODO: implement initState
    super.initState();

    launchUrl(_url, mode: LaunchMode.externalNonBrowserApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb9d2ff),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 45,
        backgroundColor: const Color(0xFF729ee2),
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Icon(Icons.approval, size: 20, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Menu.Electronic Approval'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView( // this will make your body scrollable
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child : SingleChildScrollView ( // this will make your body scrollable
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /// Recent Posts
                          Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color(0xFFC8DEFF)),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    height: 40,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        ButtonTheme(
                                                          child: ElevatedButton(
                                                            child:Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Icon(Icons.ads_click, size: 20),
                                                                SizedBox(width:10),
                                                                Text('Electronic Approval.Open Electronic Approval'.tr(), style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
                                                              ],
                                                            ),
                                                            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                                                            onPressed: () async {
                                                              if (!await launchUrl(_url, mode: LaunchMode.externalNonBrowserApplication)) {
                                                                throw Exception('Could not launch $_url');
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}