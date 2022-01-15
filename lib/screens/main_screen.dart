import 'package:flutter/material.dart';
import 'package:ingapirca_app/screens/categories.dart';
import 'package:ingapirca_app/screens/home.dart';
import 'package:ingapirca_app/util/caminos.dart';
import 'package:ingapirca_app/util/lugares.dart';
import 'package:ingapirca_app/widgets/category_item.dart';
import 'package:ingapirca_app/widgets/detail_lugar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;
  int index = 0;
  List icons = [
    Icons.home,
    Icons.history,
    Icons.camera,
    Icons.star,
    Icons.restaurant_sharp,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          Home(),
          DeatilLugar(
            img: _getpage('PARROQUIA DE INGAPIRCA')['img'],
            description: _getpage('PARROQUIA DE INGAPIRCA')['description'],
            title: _getpage('PARROQUIA DE INGAPIRCA')['name'],
          ),
          Home(),
          Home(),
          Categories()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7),
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(2),
            buildTabIcon(3),
            buildTabIcon(4),
            SizedBox(width: 7),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.camera,
        ),
        onPressed: () => {_scannerEvent()},
      ),
    );
  }

  _scannerEvent() {
    Permission.camera.request().then((dato) => dato.isGranted
        ? scanner.scan().then((valor) {
            _goToPage(valor);
          })
        : print('no tiene datos'));
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  buildTabIcon(int index) {
    if (index == 2) {
      return IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
          color: Colors.transparent,
        ),
        onPressed: null,
      );
    } else {
      return IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
        ),
        color: _page == index
            ? Theme.of(context).accentColor
            : Theme.of(context).textTheme.caption!.color,
        onPressed: () => _pageController.jumpToPage(index),
      );
    }
  }

  void _goToPage(String? valor) {
    var estado = false;
    lugares.forEach((element) {
      if (element['img'].toString().endsWith(valor.toString())) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DeatilLugar(
                    img: element['img'],
                    title: element['title'],
                    description: element['description'],
                  )),
        );
        estado = true;
      }
    });

    if (!estado) {
      print('Hola error');
    }
  }

  _getpage(String s) {
    switch (s) {
      case 'PARROQUIA DE INGAPIRCA':
        return caminos[6];
        break;
    }
  }
}
