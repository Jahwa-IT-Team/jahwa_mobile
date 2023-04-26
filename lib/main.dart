import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:jahwa_mobile/common/program_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
          supportedLocales: [Locale('en', 'US'), Locale('ko', 'KR'), Locale('vi', 'VN'), Locale('zh', 'CN')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en', 'US'),
          child: MainApp()
      ),
  );
  print("open Main App : " + DateTime.now().toString());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Jahwa Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontSizeFactor: 0.8,
          fontSizeDelta: 1.0,
        ),
      ),
      routes: routes, /// program_list.dart에 정의된 주소를 기반으로 이동을 진행함
    );
  }
}