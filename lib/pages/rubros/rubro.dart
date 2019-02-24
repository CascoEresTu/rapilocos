import 'package:flutter/material.dart';
import 'package:rapilocos/pages/rubros/orden.dart';

class Rubro extends StatelessWidget {
  String rubro;
  String titulo = '';
  Rubro({Key key, @required this.rubro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (rubro == 'restaurantes') {
      titulo = 'Restaurantes';
    } else if (rubro == 'utiles') {
      titulo = 'Utiles';
    } else if (rubro == 'supermercado') {
      titulo = 'SuperMercados';
    } else if (rubro == 'ferreteria') {
      titulo = 'Ferreterias';
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Image.asset('assets/rapi.png', fit: BoxFit.cover),
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Display passed data from first screen
          new Text(rubro),
          new RaisedButton(
              child: new Text("Go Back!"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orden(rubro: rubro,)),
                );                
              }),
        ],
      )),
    );
  }
}
