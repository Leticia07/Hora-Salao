import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/login.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/backgroundImage.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  Login loginController = new Login();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: BackgroundImage(
              hasOpacity: true,
            ),
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent, //darkGrey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      TopBar(
                        forgetPassButton: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: black,
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    color: black,
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  hintText: "email@email.com",
                                  hintStyle: TextStyle(
                                    color: black,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: black,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: black,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                  fontFamily: 'Roboto',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Fluttertoast.showToast(msg: "Insira um email");
                                    return "";
                                  }
                                },
                                onChanged: (value) => {
                                  _formKey.currentState.save(),
                                },
                                onSaved: (input) => {
                                  _formKey.currentState.setState(() {
                                    _email = input;
                                  })
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Senha",
                                  labelStyle: TextStyle(
                                    color: black,
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: black,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: black,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                  fontFamily: 'Roboto',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Fluttertoast.showToast(msg: "Insira uma senha");
                                    return "";
                                  }
                                },
                                onChanged: (value) => {
                                  _formKey.currentState.save(),
                                },
                                onSaved: (input) => {
                                  _formKey.currentState.setState(() {
                                    _password = input;
                                  })
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: FlatButton(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  onPressed: () async {
                                    _formKey.currentState.save();
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      loginController.login(_email, _password).then((value) {
                                        if (value) {
                                          Navigator.pushReplacementNamed(context, "/home");
                                        } else {
                                          Fluttertoast.showToast(msg: "Erro ao tentar logar!");
                                        }
                                        setState(() {
                                          loading = false;
                                        });
                                      });
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(
                                        color: white,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 44,
                                    width: 142,
                                    child: Text(
                                      "Entrar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: darkGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          loading
              ? Positioned(
                  child: Loading(),
                )
              : Container(),
        ],
      ),
    );
  }
}
