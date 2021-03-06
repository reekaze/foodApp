import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/account.dart';
import 'package:test_project/pages/favorite.dart';
import 'package:test_project/pages/more.dart';
import 'package:test_project/services/Cards.dart';
import 'package:test_project/services/FoodList.dart';
import 'package:test_project/services/Foods.dart';
import 'package:test_project/services/application_favorite.dart';
import 'package:test_project/styles/CustomStyle.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  void onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String? downUrl;
  FirebaseStorage storage = FirebaseStorage.instance;

  wait() async {
    String downloadURL = await storage
        .ref('uploads/profile/${auth.currentUser!.uid}/profilePic.png')
        .getDownloadURL();
    setState(() {
      downUrl = downloadURL;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wait();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomStyle.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomStyle.backgroundColor,
        foregroundColor: CustomStyle.foregroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/menu_icon.svg')),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.location_on),
                  color: CustomStyle.brown,
                ),
                const Text(
                  'Jakarta, ',
                  style: CustomStyle.city,
                ),
                const Text(
                  'ID',
                  style: CustomStyle.country,
                ),
              ],
            ),
            downUrl != null
                ? IconButton(
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        downUrl!,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    onPressed: () {},
                  )
                : IconButton(
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    onPressed: () {},
                  )
          ],
        ),
      ),
      body: [
        Body(),
        Favorite(),
        Account(),
        More(),
      ].elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CustomStyle.red,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        onTap: onTapItem,
        currentIndex: selectedIndex,
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

  const Body({Key? key}) : super(key: key);
}

class _BodyState extends State<Body> {
  String type = "Burgers";
  set string(String value) => setState(() => type = value);

  Future<void> _onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        children: [
          Text(
            'Hey!',
            style: CustomStyle.heyText,
          ),
          Text(
            "Let's get your order",
            style: CustomStyle.letsget,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            child: Material(
              elevation: 10,
              shadowColor: CustomStyle.grey,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search our delicious burger",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CardList(callback: (val) => setState(() => type = val)),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: CustomStyle.bold18,
              ),
              TextButton(
                  onPressed: () {},
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "View all ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomStyle.red,
                            fontSize: 12)),
                    WidgetSpan(
                        child: Icon(
                      Icons.keyboard_arrow_right,
                      color: CustomStyle.red,
                      size: 15,
                    ))
                  ])))
            ],
          ),
          FoodList(selected: type),
        ],
      ),
    );
  }
}

class CardList extends StatefulWidget {
  final Function callback;
  const CardList({Key? key, required this.callback}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<Cards> cards = [
    Cards(
        isTapped: true,
        foodName: 'Burgers',
        foodIcon: 'assets/icons/burger_icon.png'),
    Cards(
        isTapped: false,
        foodName: 'Pizza',
        foodIcon: 'assets/icons/pizza_icon.png'),
    Cards(
        isTapped: false,
        foodName: 'Cakes',
        foodIcon: 'assets/icons/cake_icon.png'),
  ];

  var selectedIndex = 0;

  void onTapChange(index) {
    setState(() {
      cards[selectedIndex].isTapped = false;
      cards[index].isTapped = true;
      selectedIndex = index;
      widget.callback(cards[index].foodName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: ListView.builder(
        itemCount: cards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Card(
              color: cards[index].isTapped
                  ? CustomStyle.red
                  : CustomStyle.backgroundColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                splashColor: Colors.red.withAlpha(80),
                onTap: () => onTapChange(index),
                child: SizedBox(
                  width: 110,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                          child: Image.asset(
                        cards[index].foodIcon,
                        fit: BoxFit.fill,
                        width: 50,
                        height: 50,
                      )),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        cards[index].foodName,
                        style: TextStyle(
                            color: cards[index].isTapped
                                ? CustomStyle.backgroundColor
                                : CustomStyle.foregroundColor),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            radius: 13,
                            backgroundColor: cards[index].isTapped
                                ? CustomStyle.backgroundColor
                                : CustomStyle.foregroundColor,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: cards[index].isTapped
                                  ? CustomStyle.red
                                  : CustomStyle.backgroundColor,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
