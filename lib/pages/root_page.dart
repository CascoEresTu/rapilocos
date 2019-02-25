import 'package:flutter/material.dart';
import 'package:rapilocos/pages/login_signup_page.dart';
import 'package:rapilocos/services/authentication.dart';
import 'package:rapilocos/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
FirebaseDatabase.instance
        .reference()
        .child('Users')
        .once()
        .then((DataSnapshot snap) {
      var data = snap.value;
      mail = data[widget.userId]['correo'];
      name = data[widget.userId]['nombre'];
      tipo = data[widget.userId]['tipo'];
    });
*/
class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  String mail = "";
  String name = "";
  int tipo = 0;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void _onLoggedIn() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });

    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void _onSignedOut() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  void getData() async {
      DocumentSnapshot snapshot = await Firestore.instance
        .collection('Users')
        .document(_userId).get();

    Firestore.instance
        .collection('Users')
        .document(_userId)
        .get()
        .then((docSnap) {
       mail = snapshot['correo'];
       name =snapshot['nombre'];
       tipo =snapshot['tipo'];
    });
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return _buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginSignUpPage(
          auth: widget.auth,
          onSignedIn: _onLoggedIn,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          getData();
          return new HomePage(
            userId: _userId,
            auth: widget.auth,
            onSignedOut: _onSignedOut,
            /////////////////////
            mail: mail,
            name: name,
            tipo: tipo,

            /////////////////////
          );
        } else
          return _buildWaitingScreen();
        break;
      default:
        return _buildWaitingScreen();
    }
  }
}
