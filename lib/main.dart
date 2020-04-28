import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selapprity/pages/homePage.dart';
import 'package:selapprity/pages/messagePage.dart';
import 'package:selapprity/pages/notificationPage.dart';
import 'package:selapprity/pages/profilePage.dart';
import 'package:selapprity/pages/searchPage.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/searchPage' : (context)=> SearchPage(),
        '/messagePage':(context)=> MessagePage(),
        '/notificationpage':(context)=> NotificationPage(),
        '/profilePage':(context)=> ProfilePage(),
    },
      title: 'Celapprity Android',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

