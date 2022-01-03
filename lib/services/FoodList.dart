import 'package:flutter/material.dart';
import 'package:test_project/services/Foods.dart';

class FoodList extends StatefulWidget {
  final String selected;

  const FoodList({Key? key, required this.selected}) : super(key: key);
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<Foods> foods = [
    Foods(
        type: 'Burgers',
        name: 'Chicken Burger',
        detailName: 'California Chicken Burger',
        price: 10.5),
    Foods(
        type: 'Burgers',
        name: 'Chicken Cheese Burger',
        detailName: 'California Chicken Cheese Burger',
        price: 13),
    Foods(
        type: 'Burgers',
        name: 'Beef Burger',
        detailName: 'California Beef burger',
        price: 12),
    Foods(
        type: 'Pizza',
        name: 'Veggie Pizza',
        detailName: 'Veggie Garden Pizza',
        price: 20),
    Foods(
        type: 'Pizza',
        name: 'Cheese Pizza',
        detailName: 'Mozarella Cheese Pizza',
        price: 25),
    Foods(
        type: 'Cakes',
        name: 'Tart Cakes',
        detailName: 'Chocolate Tart Cakes',
        price: 15),
    Foods(
        type: 'Cakes',
        name: 'Brownies Cakes',
        detailName: 'Cheese Brownies Cakes',
        price: 16),
  ];

  @override
  Widget build(BuildContext context) {
    List<Foods> selectedFoods =
        foods.where((i) => i.type == widget.selected).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: selectedFoods.map((i) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(i.detailName),
                Text(i.name),
                Text('\$ ${(i.price).toString()}'),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
