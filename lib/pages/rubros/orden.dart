import 'package:flutter/material.dart';

class Orden extends StatefulWidget {
  Orden(
      {Key key,
      @required this.rubro,
      @required this.local,
      @required this.userId})
      : super(key: key);

  final String rubro;
  final String local;
  final String userId;

  @override
  OrdenState createState() {
    return new OrdenState();
  }
}

class OrdenState extends State<Orden> {
  String titulo = '';
  Color color = Colors.green;
  // List<Item> lista = new List();
  
  @override
  Widget build(BuildContext context) {

    if (widget.rubro == 'restaurantes') {
      titulo = 'Restaurantes';
      color = Colors.red[800];
    } else if (widget.rubro == 'utiles') {
      titulo = 'Utiles';
      color = Colors.purple[800];
    } else if (widget.rubro == 'supermercado') {
      titulo = 'SuperMercados';
      color = Colors.green[800];
    } else if (widget.rubro == 'ferreteria') {
      titulo = 'Ferreterias';
      color = Colors.blue[800];
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
              color: this.color,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: Text( widget.local,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                    child: Text(
                      'Pedi lo que querras!',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
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
                  
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        new RaisedButton(
                            color: Colors.yellow[800],
                            child: new Text('ANADIR A CARRITO',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
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
