import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ingapirca_app/screens/categories.dart';
import 'package:ingapirca_app/screens/trending.dart';
import 'package:ingapirca_app/util/caminos.dart';
import 'package:ingapirca_app/util/categories.dart';
import 'package:ingapirca_app/util/friends.dart';
import 'package:ingapirca_app/util/lugares.dart';
import 'package:ingapirca_app/util/restaurants.dart';
import 'package:ingapirca_app/widgets/category_item.dart';
import 'package:ingapirca_app/widgets/search_card.dart';
import 'package:ingapirca_app/widgets/slide_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            buildRestaurantRow('Museo', context),
            SizedBox(height: 10.0),
            buildRestaurantList(context),
            SizedBox(height: 10.0),
            buildCategoryRow('Camino del Inca (Qhapaq Ñan)', context),
            SizedBox(height: 10.0),
            buildCategoryList(context),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  buildRestaurantRow(String restaurant, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$restaurant",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "See all (9)",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Trending();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$category",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "See all (9)",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Categories();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildSearchBar(BuildContext context) {
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(
          top: Platform.isAndroid ? 30.0 : 50.0,
          left: 10.0,
          right: 10.0,
        ),
        child: SearchCard(),
      ),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        60.0,
      ),
    );
  }

  buildCategoryList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: caminos == null ? 0 : caminos.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = caminos[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildRestaurantList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: lugares == null ? 0 : lugares.length,
        itemBuilder: (BuildContext context, int index) {
          Map lugar = lugares[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              key: Key('sddsads'),
              img: lugar["img"],
              title: lugar["title"],
              short: lugar["short"],
              description: lugar["description"],
            ),
          );
        },
      ),
    );
  }

  buildFriendsList() {
    return Container(
      height: 50.0,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: friends == null ? 0 : friends.length,
        itemBuilder: (BuildContext context, int index) {
          String img = friends[index];

          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                img,
              ),
              radius: 25.0,
            ),
          );
        },
      ),
    );
  }
}
