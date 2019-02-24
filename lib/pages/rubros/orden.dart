import 'package:flutter/material.dart';
import 'package:rapilocos/models/item_lista.dart';

class Orden extends StatelessWidget {
  Orden({Key key, @required this.rubro}) : super(key: key);

  String rubro;
  String titulo = '';
  List<Item> lista = new List();

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
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize
              .min, // this will take space as minimum as posible(to center)
          children: <Widget>[
            Card(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      "Ordena lo que quieras",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter your username'),
                  ),
                  TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: new InputDecoration(
                      hintText: 'Descripcion',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        new RaisedButton(
                            color: Colors.yellow[800],
                            child: new Text('ANADIR A CARRITO',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
