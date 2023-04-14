import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:jahwa_mobile/Common/bubble_bottom_bar.dart';
import 'package:jahwa_mobile/Common/variable.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  void initState() {
    super.initState();
    currentIndex = 2;
    changePage;
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
            Icon(FontAwesomeIcons.search, size: bSize, color: Colors.lightGreen),
            Container(padding: EdgeInsets.only(left: 10.0),),
            Text('Search', style: TextStyle(fontSize: bSize, fontWeight: FontWeight.bold, color: Colors.white)),
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
              Navigator.pushReplacementNamed(context, '/Favorite');
            },
            child: Icon(FontAwesomeIcons.solidStar, size: 15, color: const Color(0xFFC8DEFF),),
            backgroundColor: Colors.green,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Container(
        height:40,
        child: BubbleBottomBar(
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
      ),
    );
  }
}