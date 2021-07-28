import 'package:flutter/material.dart';

class DeatilLugar extends StatefulWidget {
  DeatilLugar({Key? key}) : super(key: key);

  @override
  _DeatilLugarState createState() => _DeatilLugarState();
}

class _DeatilLugarState extends State<DeatilLugar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola soy el detalle'),
      ),
    );
  }
}
