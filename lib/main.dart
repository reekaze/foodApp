import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/foodDetail.dart';
import 'package:test_project/pages/home.dart';
import 'package:test_project/pages/loading.dart';
import 'package:test_project/pages/profile.dart';
import 'package:test_project/pages/signIn.dart';
import 'package:test_project/pages/signUp.dart';
import 'package:test_project/services/application_favorite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider<ApplicationFavorite>(
    create: (_) => ApplicationFavorite(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/signUp': (context) => SignUp(),
        '/signIn': (context) => SignIn(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/foodDetail': (context) => FoodDetail(),
      },
    ),
  ));
}
