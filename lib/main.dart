import 'package:flutter/material.dart';
import 'package:newhsms/TestNotifyScreen.dart';
import 'package:newhsms/views/home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // debugShowCheckedModeBanner: false,

      ),
      home: Home(),
      //home: TestNotifyScreen(),
    );
  }
}
