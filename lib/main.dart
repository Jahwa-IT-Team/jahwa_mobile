import 'package:flutter/material.dart';
import 'package:jahwa_mobile/program_list.dart';

void main() {
  runApp(MainApp());
  print("open Main App : " + DateTime.now().toString());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jahwa Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Malgun', /// Custom Font 사용, pubspec.yaml에 정의된 Font
      ),
      routes: routes, /// program_list.dart에 정의된 주소를 기반으로 이동을 진행함
    );
  }
}