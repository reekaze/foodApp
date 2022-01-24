import 'package:flutter/foundation.dart';
import 'package:test_project/services/Foods.dart';

class ApplicationFavorite with ChangeNotifier {
  List<Foods> _favoriteFood = <Foods>[];

  List<Foods> get favoriteFoodList => _favoriteFood;

  addFavoriteFood(Foods food) {
    _favoriteFood.add(food);
    notifyListeners();
  }

  removeFavoriteFood(Foods food) {
    _favoriteFood.removeWhere((e) => e.detailName == food.detailName);
    notifyListeners();
  }
}
