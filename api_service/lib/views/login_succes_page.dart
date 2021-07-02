import 'package:flutter/material.dart';

import 'login_page.dart';

class LoginSuccess extends StatefulWidget {
  // final String body;
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  _LoginSuccessState createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Home Page"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(
              "Login Success Page",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 30.0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('Logout'),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new LoginPage(),
                  );
                  Navigator.of(context).push(route);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // form({required Center child}) {}
}
