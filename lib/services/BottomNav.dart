import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
    ]);
  }
}
