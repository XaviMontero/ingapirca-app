import 'package:flutter/material.dart';
import 'package:ingapirca_app/model/user.dart';
import 'package:ingapirca_app/provider/db_provider.dart';
import 'package:ingapirca_app/util/preference.dart';

import 'main_screen.dart';

class Seting extends StatefulWidget {
  @override
  State<Seting> createState() => _SetingState();
}

class _SetingState extends State<Seting> {
  var preferenceList = preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Preferences'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          5.0,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            preferenceList.length,
            (index) {
              var cat = preferenceList[index];
              return GestureDetector(
                onTap: () {
                  changeStatusList(preferenceList[index]);
                },
                onLongPress: () {
                  // open dialog OR navigate OR do what you want
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          cat["img"],
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: [0.2, 0.7],
                              colors: cat['status']
                                  ? [
                                      cat['color1Activate'],
                                      cat['color2Activate'],
                                    ]
                                  : [
                                      cat['color1'],
                                      cat['color2'],
                                    ],
                              // stops: [0.0, 0.1],
                            ),
                          ),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.height,
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.height,
                            padding: const EdgeInsets.all(1),
                            // constraints: BoxConstraints(
                            //   minWidth: 20,
                            //   minHeight: 20,
                            // ),
                            child: Center(
                              child: Text(
                                cat["name"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          savePreferenceAndNavigation();
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }

  void changeStatusList(prefer) {
    for (var i = 0; i <= preferenceList.length - 1; i++) {
      if (preferenceList[i]['name'] == prefer['name']) {
        preferenceList[i]['status'] =
            preferenceList[i]['status'] ? false : true;
      }
    }

    setState(() {
      preferenceList = preferenceList;
    });
  }

  void savePreferenceAndNavigation() {
    var status = false;
    for (var i = 0; i <= preferenceList.length - 1; i++) {
      if (preferenceList[i]['status'] == true) {
        status = true;
        final user = User(
          id: preferenceList[i]['name'],
          estado: 1,
        );
        DBProvider.db.newUser(user);
      }
    }
    if (status) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }
}
