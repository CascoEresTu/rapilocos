import 'package:flutter/material.dart';
import 'package:rapilocos/pages/rubros/orden.dart';
import 'package:rapilocos/pages/rubros/orden_especial.dart';

class Rubro extends StatefulWidget {
  Rubro({Key key, @required this.rubro, @required this.userId})
      : super(key: key);
  final String rubro;
  final String userId;

  @override
  RubroState createState() {
    return new RubroState();
  }
}

class RubroState extends State<Rubro> {
  String _titulo = '';

  String _local_a = '';
  String _local_b = '';
  String _local_c = '';

  String _asset_a = '';
  String _asset_b = '';
  String _asset_c = '';
  Color _color;

  @override
  Widget build(BuildContext context) {
    if (widget.rubro == 'restaurantes') {
      _titulo = 'Restaurantes';
      _color = Colors.red[800];
      _local_a = 'Dennys';
      _local_b = 'Wendys';
      _local_c = 'Pizza Hut';

      _asset_a = 'assets/restaurantes/dennys.jpg';
      _asset_b = 'assets/restaurantes/wendys.jpg';
      _asset_c = 'assets/restaurantes/pizza.jpg';
      print(widget.userId);
    } else if (widget.rubro == 'utiles') {
      _titulo = 'Utiles';
      _color = Colors.purple[800];

      _local_a = 'Utiles De Honduras';
      _local_b = 'Office Depot';
      _local_c = 'Larach & Cia Office';

      _asset_a = 'assets/utiles/utilesdeh.png';
      _asset_b = 'assets/utiles/office.jpg';
      _asset_c = 'assets/utiles/larach.png';
      print(widget.userId);
    } else if (widget.rubro == 'supermercados') {
      _titulo = 'SuperMercados';
      _color = Colors.green[800];

      _local_a = 'Paiz';
      _local_b = 'La Colonia';
      _local_c = 'Despensa Familiar';

      _asset_a = 'assets/super/paiz.png';
      _asset_b = 'assets/super/colonia.png';
      _asset_c = 'assets/super/despensa.png';
      print(widget.userId);
    } else if (widget.rubro == 'ferreteria') {
      _titulo = 'Ferreterias';
      _color = Colors.blue[800];

      _local_a = 'Larach & Cia';
      _local_b = 'INDUFESA';
      _local_c = 'LA MUNDIAL';

      _asset_a = 'assets/ferreteria/larach.png';
      _asset_b = 'assets/ferreteria/indufesa.jpg';
      _asset_c = 'assets/ferreteria/mundial.jpg';
      print(widget.userId);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Image.asset('assets/rapi.png', fit: BoxFit.cover),
        //color: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView (
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Orden(
                          rubro: widget.rubro,
                          local: _local_a,
                          userId: widget.userId,
                        )),
              );
            },
            child: Card(
              color: _color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: Text(
                      _local_a,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Image.asset(_asset_a, fit: BoxFit.cover),
                  // make buttons use the appropriate styles for cards
                ],
              ),
            ),
          ),
           new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Orden(
                          rubro: widget.rubro,
                          local: _local_b,
                          userId: widget.userId,
                        )),
              );
            },
            child: Card(
              color: _color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: Text(
                      _local_b,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Image.asset(_asset_b, fit: BoxFit.cover),
                  // make buttons use the appropriate styles for cards
                ],
              ),
            ),
          ),
           new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Orden(
                          rubro: widget.rubro,
                          local: _local_c,
                          userId: widget.userId,
                        )),
              );
            },
            child: Card(
              color: _color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: Text(
                      _local_c,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Image.asset(_asset_c, fit: BoxFit.cover),
                  // make buttons use the appropriate styles for cards
                ],
              ),
            ),
          ),
         
        
         
          new RaisedButton(
              child: new Text(
                "No encontraste lo que buscabas?",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              color: Colors.yellow[800],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrdenEspecial(
                            rubro: 'especial',
                            userId: widget.userId,
                          )),
                );
              }),
        ],
      )),
    );
  }
}
