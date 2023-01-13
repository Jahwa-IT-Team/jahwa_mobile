import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          ///scaffoldBackgroundColor: const Color(0xFFB7CDFF),
      ),
      home: const MyHomePage(title: 'Program Title - 프로그램 제목'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 35,
        backgroundColor: const Color(0xFF99bcee),
        elevation: 0.0,
        title: Text(widget.title, style: TextStyle(fontFamily: 'KotraHope', fontSize:16, color: Colors.white, fontWeight: FontWeight.normal, letterSpacing: 1.0, height: 1.0,
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
  ///              const Text(
  ///                'Important Text Font...',
  ///                style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.w100, color: Colors.black,
  ///                  shadows: <Shadow>[
  ///                  Shadow(
  ///                    offset: Offset(3.0, 3.0),
  ///                    blurRadius: 15.0,
  ///                    color: Color.fromARGB(255, 0, 0, 0),
  ///                  ),
  ///                ],
  ///                ),
  ///              ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Where there is a will there is a way.',
                          style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.white,),
                        ),
                        const Text(
                          'Where there is a will there is a way.',
                          style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.white,),
                        ),
                        const Text(
                          'Where there is a will there is a way.',
                          style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.white,),
                        ),
                        const Text(
                          'Where there is a will there is a way.',
                          style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.white,),
                        ),
                        const Text(
                          '한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.white,),
                        ),
                        const Text(
                          '한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.white,),
                        ),
                        const Text(
                          '한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.white,),
                        ),
                        const Text(
                          '한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: const Color(0xFF83aae6),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'KotraHope - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'KotraHope', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'KotraHope - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'KotraHope', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'KotraHope - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'KotraHope', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'KotraHope - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'KotraHope', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'KotraHope - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'KotraHope', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'KotraHope - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'KotraHope', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'KotraHope - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'KotraHope', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'KotraHope - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'KotraHope', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'KGTitleL - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'KGTitleL', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'KGTitleL - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'KGTitleL', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'KGTitleL - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'KGTitleL', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'KGTitleL - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'KGTitleL', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'KGTitleL - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'KGTitleL', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'KGTitleL - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'KGTitleL', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'KGTitleL - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'KGTitleL', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'KGTitleL - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'KGTitleL', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC7DEFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'LexendDeca - Where there is a will there is a way.',
                        style: TextStyle(fontFamily: 'LexendDeca', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                      ),
                      const Text(
                        'LexendDeca - Where there is a will there is a way.',
                        style: TextStyle(fontFamily: 'LexendDeca', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                      ),
                      const Text(
                        'LexendDeca - Where there is a will there is a way.',
                        style: TextStyle(fontFamily: 'LexendDeca', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                      ),
                      const Text(
                        'LexendDeca - Where there is a will there is a way.',
                        style: TextStyle(fontFamily: 'LexendDeca', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                      ),
                      const Text(
                        'LexendDeca - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                        style: TextStyle(fontFamily: 'LexendDeca', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                      ),
                      const Text(
                        'LexendDeca - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                        style: TextStyle(fontFamily: 'LexendDeca', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                      ),
                      const Text(
                        'LexendDeca - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                        style: TextStyle(fontFamily: 'LexendDeca', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                      ),
                      const Text(
                        'LexendDeca - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                        style: TextStyle(fontFamily: 'LexendDeca', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Mitr - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Mitr', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Mitr - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Mitr', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Mitr - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Mitr', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Mitr - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Mitr', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Mitr - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Mitr', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Mitr - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Mitr', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Mitr - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Mitr', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Mitr - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Mitr', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC7DEFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Itim - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Itim - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Itim - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Itim - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Itim - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Itim - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Itim - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Itim - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'NanumBarunGothic - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'NanumBarunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'NanumBarunGothic', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC7DEFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'MalgunGothic - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'MalgunGothic - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'MalgunGothic', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'HappyGH - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 26 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 26 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 22 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 22 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 26 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 26 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 24 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 24 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 22 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 22 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 20 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'HappyGH - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'HappyGH', fontSize: 20 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC7DEFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'JSArirangHON - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSArirangHON - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSArirangHON', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'JSDongkang - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'JSDongkang - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'JSDongkang', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC7DEFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'WandocleanseaR - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaR - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaR', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'WandocleanseaB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'WandocleanseaB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'WandocleanseaB', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC7DEFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'ShinYB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'ShinYB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'ShinYB', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Youth - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Youth - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Youth', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC7DEFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Line - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Line - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Line - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Line - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Line - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Line - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Line - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Line - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Line - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Line - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'Line - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'Line - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'Line', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'LineB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineB - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineB', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFC7DEFF),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'LineT - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - Where there is a will there is a way.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 16 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 16 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 14 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 14 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 12 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 12 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 10 ,fontWeight: FontWeight.normal, color: Colors.black,),
                        ),
                        const Text(
                          'LineT - 한국어에 대한 폰트의 중요성을 알아야 합니다.',
                          style: TextStyle(fontFamily: 'LineT', fontSize: 10 ,fontWeight: FontWeight.bold, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
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
