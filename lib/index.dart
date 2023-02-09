import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 35,
          backgroundColor: const Color(0xFF99bcee),
          elevation: 0.0,
          title: Text("Font List - 폰트 현황", style: TextStyle(fontFamily: 'KotraHope', fontSize:16, color: Colors.white, fontWeight: FontWeight.normal, letterSpacing: 1.0, height: 1.0,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 15.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child : SingleChildScrollView ( // this will make your body scrollable
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget> [
                                IconButton(
                                    icon: FaIcon(FontAwesomeIcons.codeBranch),
                                    iconSize: 50,
                                    color: Colors.blueAccent,
                                    onPressed: () { Navigator.pushNamed(context, '/FontList'); }
                                ),
                                Text('Font List', style: TextStyle(fontSize: 13)),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      color: const Color(0xFF83aae6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}