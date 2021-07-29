import 'package:flutter/material.dart';

class DeatilLugar extends StatefulWidget {
  final String img;
  final String title;
  final String description;
  DeatilLugar({
    Key? key,
    required this.img,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _DeatilLugarState createState() => _DeatilLugarState();
}

class _DeatilLugarState extends State<DeatilLugar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _detailLugar(),
    );
  }

  Widget _detailLugar() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 30.0),
        Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              widget.img,
              height: 300.0,
              width: MediaQuery.of(context).size.width - 40.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Historia",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(16.0),
          child: Text(
            widget.description,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15.0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
 
 
  }
}
