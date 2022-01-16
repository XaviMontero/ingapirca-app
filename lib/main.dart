import 'package:flutter/material.dart';
import 'package:ingapirca_app/model/user.dart';
import 'package:ingapirca_app/provider/db_provider.dart';
import 'package:ingapirca_app/screens/main_screen.dart';
import 'package:ingapirca_app/screens/setings.dart';
import 'package:ingapirca_app/util/const.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: FutureBuilder(
        future: DBProvider.db.getAllUser(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          assert(context != null);
          if (snapshot.hasData) {
            return snapshot.data!.isEmpty ? Seting() : MainScreen();
          }
          return Container(child: Center(child: CircularProgressIndicator()));
        },
      )
      /* */,
    );
  }
}
