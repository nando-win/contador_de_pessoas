import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pesoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = 'Bora entrar?!';
  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if(_people < 0){
        _infoText = "I was here!";
      } else if (_people == 0){
        _infoText = "Bora pegar as cadeiras da frente!";
      } else if (_people <= 10){
        _infoText = "Bora menino, se não vamos ficar em pé!";
      } else if (_people > 10){
        _infoText = "Agora lascou!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/page_atlanta.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () {
                          _changePeople(1);
                        },
                        child: Text(
                          "+1",
                          style:
                          TextStyle(fontSize: 40.0, color: Colors.black),
                        ))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () {
                          _changePeople(-1);
                        },
                        child: Text(
                          "-1",
                          style:
                          TextStyle(fontSize: 40.0, color: Colors.white),
                        ))),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        ),
      ],
    );
  }
}
