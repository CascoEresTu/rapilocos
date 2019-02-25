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
  String titulo = '';

  String local_a = '';
  String local_b = '';
  String local_c = '';

  String asset_a = '';
  String asset_b = '';
  String asset_c = '';
  Color color;

  @override
  Widget build(BuildContext context) {
    if (widget.rubro == 'restaurantes') {
      titulo = 'Restaurantes';
      color = Colors.red[800];
      local_a = 'Dennys';
      local_b = 'Wendys';
      local_c = 'Pizza Hut';

      asset_a = 'assets/restaurantes/dennys.jpg';
      asset_b = 'assets/restaurantes/wendys.jpg';
      asset_c = 'assets/restaurantes/pizza.jpg';
      print(widget.userId);
    } else if (widget.rubro == 'utiles') {
      titulo = 'Utiles';
      color = Colors.purple[800];

      local_a = 'Utiles De Honduras';
      local_b = 'Office Depot';
      local_c = 'Larach & Cia Office';

      asset_a = 'assets/utiles/utilesdeh.png';
      asset_b = 'assets/utiles/office.jpg';
      asset_c = 'assets/utiles/larach.png';
      print(widget.userId);
    } else if (widget.rubro == 'supermercados') {
      titulo = 'SuperMercados';
      color = Colors.green[800];

      local_a = 'Paiz';
      local_b = 'La Colonia';
      local_c = 'Despensa Familiar';

      asset_a = 'assets/super/paiz.png';
      asset_b = 'assets/super/colonia.png';
      asset_c = 'assets/super/despensa.png';
      print(widget.userId);
    } else if (widget.rubro == 'ferreteria') {
      titulo = 'Ferreterias';
      color = Colors.blue[800];

      local_a = 'Larach & Cia';
      local_b = 'INDUFESA';
      local_c = 'LA MUNDIAL';

      asset_a = 'assets/ferreteria/larach.png';
      asset_b = 'assets/ferreteria/indufesa.jpg';
      asset_c = 'assets/ferreteria/mundial.jpg';
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
                          local: local_a,
                          userId: widget.userId,
                        )),
              );
            },
            child: Card(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: Text(
                      local_a,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Image.asset(asset_a, fit: BoxFit.cover),
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
                          local: local_b,
                          userId: widget.userId,
                        )),
              );
            },
            child: Card(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: Text(
                      local_b,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Image.asset(asset_b, fit: BoxFit.cover),
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
                          local: local_c,
                          userId: widget.userId,
                        )),
              );
            },
            child: Card(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: Text(
                      local_c,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Image.asset(asset_c, fit: BoxFit.cover),
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
