import 'package:flutter/foundation.dart';
import 'package:test_project/services/Carts.dart';

class ApplicationCart with ChangeNotifier {
  List<Carts> _cart = <Carts>[];
  List<Carts> get cartList => _cart;
}
