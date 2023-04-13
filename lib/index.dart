import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import 'package:jahwa_mobile/Common/bubble_bottom_bar.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late int currentIndex;

  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFb9d2ff),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50,
          backgroundColor: const Color(0xFF729ee2),
          elevation: 0.0,
          title:Row(
            children: <Widget> [
              Icon(FontAwesomeIcons.idCardAlt,
                size: 13, //Icon Size
                color: Colors.lightGreen, //Color Of Icon
              ),
              Container(padding: EdgeInsets.only(left: 10.0),),
              Text('Nice to meet you, Lee Yong Seong.', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
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
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget> [
                                Row(
                                  children: <Widget> [
                                    Icon(FontAwesomeIcons.listUl,
                                      size: 13, //Icon Size
                                      color: Colors.indigoAccent, //Color Of Icon
                                    ),
                                    Container(padding: EdgeInsets.only(left: 10.0),),
                                    Text('Recent Posts', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF000000))),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            height: 20,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                Container(padding: EdgeInsets.only(left: 10.0),),
                                                Flexible(
                                                  child: Text('Posts 1 가나다라마바사아자차가타파하거너더러머버서어저처커터퍼허고노도로모보소오조초코토포호구누두루무부수우주추쿠투푸후', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 1"); }, // Handle your callback
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 20,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                Container(padding: EdgeInsets.only(left: 10.0),),
                                                Flexible(
                                                  child: Text('Posts 2 가나다라마바사아자차가타파하거너더러머버서어저처커터퍼허고노도로모보소오조초코토포호구누두루무부수우주추쿠투푸후', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 2"); },
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 20,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                Container(padding: EdgeInsets.only(left: 10.0),),
                                                Flexible(
                                                  child: Text('Posts 3 가나다라마바사아자차가타파하거너더러머버서어저처커터퍼허고노도로모보소오조초코토포호구누두루무부수우주추쿠투푸후', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 3"); },
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 20,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                Container(padding: EdgeInsets.only(left: 10.0),),
                                                Flexible(
                                                  child: Text('Posts 4 가나다라마바사아자차가타파하거너더러머버서어저처커터퍼허고노도로모보소오조초코토포호구누두루무부수우주추쿠투푸후', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 4"); },
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 20,
                                            child: Row(
                                              children: <Widget> [
                                                Icon(Icons.circle, size: 8, color: Colors.black54),
                                                Container(padding: EdgeInsets.only(left: 10.0),),
                                                Flexible(
                                                  child: Text('Posts 5 가나다라마바사아자차가타파하거너더러머버서어저처커터퍼허고노도로모보소오조초코토포호구누두루무부수우주추쿠투푸후', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () { print("Click event on Container 5"); },
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: const Color(0xFFC8DEFF),
                    ),
                  ),
                  /// My Working Time
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget> [
                                Row(
                                  children: <Widget> [
                                    Icon(FontAwesomeIcons.userClock,
                                      size: 13, //Icon Size
                                      color: Colors.indigoAccent, //Color Of Icon
                                    ),
                                    Container(padding: EdgeInsets.only(left: 10.0),),
                                    Text('My Working Time', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF000000))),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(15.0),
                                  margin: EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('출퇴근(예정)시간', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                              SizedBox(height: 10,),
                                              Container(
                                                alignment: Alignment.center,
                                                child:Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('08:15', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF000000))),
                                                    Text(' / 16:55', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 10, fontWeight: FontWeight.normal, color: const Color(0xFF555555))),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('잔업현황', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                              SizedBox(height: 10,),
                                              Container(
                                                alignment: Alignment.center,
                                                child:Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('28.6', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF000000))),
                                                    Text(' / 52', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 10, fontWeight: FontWeight.normal, color: const Color(0xFF555555))),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('연차현황', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                              SizedBox(height: 10,),
                                              Container(
                                                alignment: Alignment.center,
                                                child:Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('17.5', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF000000))),
                                                    Text(' / 22', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 10, fontWeight: FontWeight.normal, color: const Color(0xFF555555))),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: const Color(0xFFC8DEFF),
                    ),
                  ),
                  /// Worklist
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget> [
                                Row(
                                  children: <Widget> [
                                    Icon(FontAwesomeIcons.clipboardList,
                                      size: 13, //Icon Size
                                      color: Colors.indigoAccent, //Color Of Icon
                                    ),
                                    Container(padding: EdgeInsets.only(left: 10.0),),
                                    Text('Worklist', style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF000000))),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.only(top: 10),
                                  child: IntrinsicGridView.vertical(
                                      //padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
                                      columnCount: 2,
                                      verticalSpace: 10,
                                      horizontalSpace: 10,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              Container(padding: EdgeInsets.only(left: 10.0),),
                                              Flexible(
                                                child: Text('예고함 : 5건', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              Container(padding: EdgeInsets.only(left: 10.0),),
                                              Flexible(
                                                child: Text('미결함 : 5건', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF000000))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              Container(padding: EdgeInsets.only(left: 10.0),),
                                              Flexible(
                                                child: Text('진행함 : 5건', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              Container(padding: EdgeInsets.only(left: 10.0),),
                                              Flexible(
                                                child: Text('수신함 : 5건', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              Container(padding: EdgeInsets.only(left: 10.0),),
                                              Flexible(
                                                child: Text('참조/회람함 : 952건', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget> [
                                              Icon(Icons.circle, size: 8, color: Colors.black54),
                                              Container(padding: EdgeInsets.only(left: 10.0),),
                                              Flexible(
                                                child: Text('협조진행함 : 0건', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.normal, color: const Color(0xFF000000))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                  ), //
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: const Color(0xFFC8DEFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.apps),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        //iconSize: 30,
        backgroundColor: const Color(0xFFC8DEFF),
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .8,
        currentIndex: currentIndex,
        onTap: changePage,
        //borderRadius: BorderRadius.all(Radius.circular(10)), //border radius doesn't work when the notch is enabled.
        elevation: 20,
        tilesPadding: EdgeInsets.symmetric(
          ///vertical: 10,
          horizontal: 10,
        ),
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            ///showBadge: true,
            ///badge: Text("5"),
            ///badgeColor: Colors.deepPurpleAccent,
            backgroundColor: const Color(0xFF729ee2),
            icon: Icon(
              ///FontAwesomeIcons.house,
              Icons.home,
              color: const Color(0xFF729ee2),
            ),
            activeIcon: Icon(
              FontAwesomeIcons.house,
              color: Colors.white,
            ),
            title: Text('Home', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          BubbleBottomBarItem(
              backgroundColor: const Color(0xFF729ee2),
              icon: Icon(
                Icons.apps,
                color: const Color(0xFF729ee2),
              ),
              activeIcon: Icon(
                Icons.apps,
                color: Colors.white,
              ),
              title: Text('Menu', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          BubbleBottomBarItem(
              backgroundColor: const Color(0xFF729ee2),
              icon: Icon(
                Icons.search,
                color: const Color(0xFF729ee2),
              ),
              activeIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: Text('Search', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          BubbleBottomBarItem(
              backgroundColor: const Color(0xFF729ee2),
              icon: Icon(
                Icons.person,
                color: const Color(0xFF729ee2),
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text('My Profile', softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}