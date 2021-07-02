import 'package:flutter/material.dart';
import 'views/login_page.dart';
import 'views/login_succes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: LoginPage(),
      initialRoute: '/',
      routes: {
        'loginSuccess': (context) => LoginSuccess(),
      },
    );
  }
}
