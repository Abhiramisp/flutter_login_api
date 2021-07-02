import 'package:api_login/logic/models/response_model.dart';

import 'package:api_login/logic/services/api_service.dart';
import 'package:api_login/views/login_succes_page.dart';

import 'package:flutter/material.dart';

import 'login_succes_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  ApiServices apiServices = new ApiServices();

  final TextEditingController unameController = TextEditingController();
  final TextEditingController passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: unameController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Username",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username Required';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: passwdController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter The Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'password Required';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: ElevatedButton(
                        child: Text('Login'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var password = passwdController.text;
                            var phoneNumber = unameController.text;
                            // ignore: unused_local_variable
                            var body = {
                              "phone_number": unameController.text,
                              "password": passwdController.text,
                            };

                            ResponseModel? responseData = await apiServices
                                .loginRequest(phoneNumber, password);

                            // checking login request response value(success)==true
                            if (responseData?.success == false) {
                              // ignore: unused_local_variable
                              // Timer timer =
                              //     Timer(Duration(milliseconds: 1500), () {
                              //   Navigator.of(context, rootNavigator: true)
                              //       .pop();
                              // });
                              await showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                  child: Container(
                                    height: 65.0,
                                    width: 360.0,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Center(
                                              child: Text(
                                                responseData != null
                                                    ? responseData.reason
                                                        .toString()
                                                    : "",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              var route = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new LoginSuccess(),
                              );
                              Navigator.of(context).push(route);
                            }
                          }
                        },
                      )),
                ],
              ),
            )));
  }
}
