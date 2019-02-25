import 'package:flutter/material.dart';
import 'package:rapilocos/services/authentication.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rapilocos/models/todo.dart';
import 'package:rapilocos/pages/profile_page.dart';
import 'package:rapilocos/pages/rubros/rubro.dart';
import 'package:rapilocos/pages/rubros/orden_especial.dart';

import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage(
      {Key key,
      this.auth,
      this.userId,
      this.onSignedOut,
      this.mail,
      this.name,
      this.tipo})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  final String mail;
  final String name;
  final int tipo;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<Todo> _todoList;
  final String title = '';
  
  final Firestore  db =Firestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();

  
  bool _isEmailVerified = false;

  @override
  void initState() {
  

    super.initState();

    _checkEmailVerification();
   
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    //_onTodoAddedSubscription.cancel();
    //_onTodoChangedSubscription.cancel();
    super.dispose();
  }

 

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Image.asset('assets/rapi.png', fit: BoxFit.cover),
          backgroundColor: Colors.black),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize
              .min, // this will take space as minimum as posible(to center)
          children: <Widget>[
            Card(
              color: Colors.red[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      'RESTAURANTES',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Image.asset('assets/restaurantes.jpg', fit: BoxFit.cover),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        new RaisedButton(
                          color: Colors.yellow[800],
                          child: new Text('Restaurantes',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Rubro(
                                        rubro: 'restaurantes', userId: widget.userId)));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      'FERRETERIA',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Image.asset('assets/ferreteria.jpg', fit: BoxFit.cover),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        new RaisedButton(
                          color: Colors.yellow[800],
                          child: new Text('Ferreteria',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Rubro(
                                        rubro: 'ferreteria', userId: widget.userId)));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.green[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      'SUPERMERCADOS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Image.asset('assets/super.jpg', fit: BoxFit.cover),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        new RaisedButton(
                          color: Colors.yellow[800],
                          child: new Text('SuperMercados',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Rubro(
                                        rubro: 'supermercados', userId: widget.userId)));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.purple[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      'UTILES',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Image.asset('assets/utiles.jpg', fit: BoxFit.cover),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        new RaisedButton(
                          color: Colors.yellow[800],
                          child: new Text('Utiles',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Rubro(
                                        rubro: 'utiles', userId: widget.userId)));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.yellow[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      'NO ENCUENTRAS LO QUE ESTAS BUSCANDO?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Image.asset('assets/otros.jpg', fit: BoxFit.cover),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        new RaisedButton(
                          color: Colors.yellow[800],
                          child: new Text('Llevame a un rapimandado especial',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new OrdenEspecial(
                                        rubro: 'especial', userId: widget.userId)));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(
                          userId: widget.userId,
                          mail: widget.mail,
                          name: widget.name,
                          tipo: widget.tipo)),
                );
              },
              child: new UserAccountsDrawerHeader(
                accountName: Text(widget.name),
                accountEmail: Text(widget.mail),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.yellow[800],
                  child: new Text('CGCV'),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text('Inicio'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.black),
              title: Text('Carrito'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.gps_fixed, color: Colors.black),
              title: Text('Rastrear Pedido'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble, color: Colors.blue),
              title: Text('Chat Rapiloco'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.error, color: Colors.red),
              title: Text('Log Out'),
              onTap: () {
                _signOut();
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
