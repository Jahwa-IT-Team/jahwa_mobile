import 'dart:async';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:jahwa_mobile/common/bubble_bottom_bar.dart';
import 'package:jahwa_mobile/common/variable.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  void initState() {
    super.initState();
    currentIndex = 1;
    changePage;
    _initPackageInfo();
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
      if(index == 0) Navigator.pushReplacementNamed(context, '/');
      else if(index == 1) Navigator.pushReplacementNamed(context, '/Menu');
      else if(index == 2) Navigator.pushReplacementNamed(context, '/Search');
      else if(index == 3) Navigator.pushReplacementNamed(context, '/Profile');
    });
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
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
        title:Row(
          children: <Widget> [
            Icon(Icons.apps, size: 20, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Menu', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
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
                _infoTile('App name', _packageInfo.appName),
                _infoTile('Package name', _packageInfo.packageName),
                _infoTile('App version', _packageInfo.version),
                _infoTile('Build number', _packageInfo.buildNumber),
                _infoTile('Build signature', _packageInfo.buildSignature),
                _infoTile(
                  'Installer store',
                  _packageInfo.installerStore ?? 'not available',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 45.0,
        width: 45.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Favorite');
            },
            child: Icon(FontAwesomeIcons.solidStar, size: 15, color: const Color(0xFFC8DEFF),),
            backgroundColor: Colors.green,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        iconSize: 18,
        backgroundColor: const Color(0xFFC8DEFF),
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .8,
        currentIndex: currentIndex,
        onTap: changePage,
        //borderRadius: BorderRadius.all(Radius.circular(10)), //border radius doesn't work when the notch is enabled.
        elevation: 20,
        tilesPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 8,
        ),
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            ///showBadge: true,
            ///badge: Text("5"),
            ///badgeColor: Colors.deepPurpleAccent,
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
      ),
    );
  }
}