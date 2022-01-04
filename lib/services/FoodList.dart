import 'package:flutter/material.dart';
import 'package:test_project/pages/foodDetail.dart';
import 'package:test_project/services/Foods.dart';
import 'package:test_project/styles/CustomStyle.dart';

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
      price: 10.5,
      image: 'assets/images/burger.jfif',
    ),
    Foods(
      type: 'Burgers',
      name: 'Chicken Cheese Burger',
      detailName: 'California Chicken Cheese Burger',
      price: 13,
      image: 'assets/images/burger.jfif',
    ),
    Foods(
      type: 'Burgers',
      name: 'Beef Burger',
      detailName: 'California Beef burger',
      price: 12,
      image: 'assets/images/burger.jfif',
    ),
    Foods(
      type: 'Pizza',
      name: 'Veggie Pizza',
      detailName: 'Veggie Garden Pizza',
      price: 20,
      image: 'assets/images/pizza.jfif',
    ),
    Foods(
      type: 'Pizza',
      name: 'Cheese Pizza',
      detailName: 'Mozarella Cheese Pizza',
      price: 25,
      image: 'assets/images/pizza.jfif',
    ),
    Foods(
      type: 'Cakes',
      name: 'Tart Cakes',
      detailName: 'Chocolate Tart Cakes',
      price: 15,
      image: 'assets/images/cakes.jfif',
    ),
    Foods(
      type: 'Cakes',
      name: 'Brownies Cakes',
      detailName: 'Cheese Brownies Cakes',
      price: 16,
      image: 'assets/images/cakes.jfif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void onTapFoodList(Foods food) {
      Navigator.pushNamed(context, '/foodDetail', arguments: food);
    }

    List<Foods> selectedFoods =
        foods.where((i) => i.type == widget.selected).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: selectedFoods.map((i) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: InkWell(
              onTap: () => onTapFoodList(i),
              splashColor: CustomStyle.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        i.image,
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          i.detailName,
                          style: CustomStyle.bold14black,
                        ),
                        Text(
                          '\$ ${(i.price).toString()}',
                          style: CustomStyle.bold14black,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Text(
                      i.name,
                      style: CustomStyle.grey14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
