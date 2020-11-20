import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/login.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/topBar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  Login loginController = new Login();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(),
        color: mainBgColor,
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
                        color: darkGrey,
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
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "email@email.com",
                            hintStyle: TextStyle(
                              color: mainTextColor,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: darkGrey,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: darkGrey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: darkGrey,
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
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: darkGrey,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: darkGrey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          obscureText: true,
                          style: TextStyle(
                            color: darkGrey,
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
                                loginController.login(_email, _password).then((value) {
                                  if (value) {
                                    Navigator.pushReplacementNamed(context, "/home");
                                  } else {
                                    Fluttertoast.showToast(msg: "Erro ao tentar logar!");
                                  }
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: darkGrey,
                                border: Border.all(
                                  color: Color(0xFFA3A3A372),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 44,
                              width: 142,
                              child: Text(
                                "Entrar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: white,
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
    );
  }
}
