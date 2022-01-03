import 'package:flutter/material.dart';
import 'package:test_project/pages/home.dart';
import 'package:test_project/pages/loading.dart';
import 'package:test_project/pages/profile.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
      },
    ));
