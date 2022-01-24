import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/services/application_favorite.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationFavorite>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: appState.favoriteFoodList.map((i) {
        return Text(i.detailName);
      }).toList(),
    );
  }
}
