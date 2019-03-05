import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Carrito extends StatefulWidget {
  Carrito({Key key, @required this.rubro, @required this.userId})
      : super(key: key);
  final String rubro;
  final String userId;
  List itemID = new List();

  @override
  CarritoState createState() {
    return new CarritoState();
  }
}


class CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Image.asset('assets/rapi.png', fit: BoxFit.cover),
        backgroundColor: Colors.black,
      ),
      body: new Column(children: <Widget>[
        new Align(
          child: fetchData(context),
        ),
        new RaisedButton(
            color: Colors.yellow[800],
            child: new Text('CONFIRMAR ORDEN',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            onPressed: () {}),
        //fetchData(context),
      ]),
    );
  }

  void _deleteItem(){

  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("ESPERA!",
              style: new TextStyle(
                color: Colors.red,
              )),
          content: new Text("Estas seguro que ya no quieres esto?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              color: Colors.yellow[800],
              child: new Text("Salir",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              color: Colors.red,
              child: new Text("Eliminar",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Items').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          default:
            return new ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                children: getExpenseItems(snapshot));
        }
      },
    );
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {

    snapshot.data.documents.map((doc) => widget.itemID.add(doc['id']));
        
    List x = snapshot.data.documents
        .map((doc) => new ListTile(
              title: Text(doc['nombre']),
              subtitle: Text(doc['descripcion']),
              trailing: new IconButton(
                icon: new Icon(Icons.delete_forever),
                color: Colors.red,
                iconSize: 30,
                onPressed: () {
                  _showDialog();
                },
              ),
            ))
        .toList();
    return x;
  }
}
/*
child: new Card(
                    color: Colors.white,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Nombre del Articulo',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        new Text(doc['nombre']),
                        Text(
                          "Descripcion",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.blue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        new Text(doc['descripcion']),
                      ],
                    ),
                  ),


*/
