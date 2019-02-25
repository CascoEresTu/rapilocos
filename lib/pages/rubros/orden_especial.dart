import 'package:flutter/material.dart';
import 'package:rapilocos/models/item_lista.dart';

class OrdenEspecial extends StatelessWidget {
  OrdenEspecial({Key key, @required this.rubro, @required this.userId}) : super(key: key);

  String rubro;
  String titulo = '';
  
  final String userId;
  //List<Item> lista = new List();

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
        backgroundColor: Colors.black,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize
              .min, // this will take space as minimum as posible(to center)
          children: <Widget>[
            Card(
              color: Colors.black,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      "Ordena lo que quieras!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "Nombre del Local",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                    child: new TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      decoration: new InputDecoration(
                        hintText: 'Dennys, Larach, Utiles de Honduras...',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                        border: new OutlineInputBorder(
                          //borderRadius: new BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'Name can\'t be empty' : null,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "Nombre del Articulo",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                    child: new TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      decoration: new InputDecoration(
                        hintText: 'Llave allen, esparadrapo...',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                        border: new OutlineInputBorder(
                         // borderRadius: new BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'Name can\'t be empty' : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "Descripcion",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                    child: TextField(
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        hintText: 'Lo quiero sin sal, sin cebolla...',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                        border: new OutlineInputBorder(
                          //borderRadius: new BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Text(
                      "Direccion",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                    child: TextField(
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        hintText: 'Colonia 3 caminos, cerca de ...',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                        border: new OutlineInputBorder(
                         // borderRadius: new BorderRadius.circular(12.0),
                        ),
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
                                style: TextStyle(color: Colors.white , fontSize: 15)),
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
