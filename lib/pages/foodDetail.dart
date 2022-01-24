import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/services/Foods.dart';
import 'package:test_project/services/application_favorite.dart';
import 'package:test_project/styles/CustomStyle.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool isTapped = false;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Foods;
    final appState = Provider.of<ApplicationFavorite>(context);
    var result =
        appState.favoriteFoodList.where((e) => e.detailName == food.detailName);
    // if (result.isNotEmpty) {
    //   isTapped = true;
    // }

    void add() {
      setState(() {
        counter += 1;
      });
    }

    void remove() {
      setState(() {
        if (counter > 0) {
          counter -= 1;
        }
      });
    }

    void onPressedBack() {
      Navigator.pop(context, {"isTapped": isTapped, "counter": counter});
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: SafeArea(
            child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: onPressedBack,
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: CustomStyle.foregroundColor,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: CustomStyle.backgroundColor,
                                onPrimary: CustomStyle.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (result.isNotEmpty) {
                                  appState.removeFavoriteFood(food);
                                } else {
                                  appState.addFavoriteFood(food);
                                }
                              });
                            },
                            child: Icon(
                              Icons.favorite_outline,
                              size: 20,
                              color: result.isNotEmpty
                                  ? CustomStyle.backgroundColor
                                  : CustomStyle.red,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: result.isNotEmpty
                                    ? CustomStyle.red
                                    : CustomStyle.backgroundColor,
                                onPrimary: CustomStyle.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      food.detailName,
                      style: CustomStyle.bold18,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        "A signature flame-grilled chicken patty topped with smoke beef",
                        textAlign: TextAlign.center,
                        style: CustomStyle.grey14,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        food.image,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 100,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'S',
                                style: CustomStyle.black20,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: CustomStyle.backgroundColor,
                                onPrimary: CustomStyle.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'L',
                                style: CustomStyle.black20,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: CustomStyle.backgroundColor,
                                onPrimary: CustomStyle.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'M',
                                style: CustomStyle.white20,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: CustomStyle.red,
                                onPrimary: CustomStyle.backgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.red[200],
                              child: IconButton(
                                onPressed: remove,
                                icon: Icon(
                                  Icons.remove,
                                  color: CustomStyle.foregroundColor,
                                ),
                              )),
                          Text(
                            counter.toString(),
                            style: CustomStyle.black24bold,
                          ),
                          CircleAvatar(
                              backgroundColor: Colors.red[200],
                              child: IconButton(
                                onPressed: add,
                                icon: Icon(
                                  Icons.add,
                                  color: CustomStyle.foregroundColor,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                left: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: CustomStyle.grey14,
                    ),
                    Text(
                      '\$ ${counter * food.price}',
                      style: CustomStyle.black24bold,
                    )
                  ],
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    child: RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Icon(Icons.shopping_bag_outlined),
                      )),
                      WidgetSpan(child: Text('Go To Cart'))
                    ])),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: CustomStyle.red,
                        onPrimary: CustomStyle.backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
