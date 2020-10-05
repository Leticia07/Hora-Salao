import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/globals.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: mainBgColor,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FontAwesome5.arrow_left,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Container(
                        child: Text("Esqueci minha senha"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
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
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkGrey,
                            width: 3.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkGrey,
                            width: 3.0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 18,
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
                            width: 3.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkGrey,
                            width: 3.0,
                          ),
                        ),
                      ),
                      obscureText: true,
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 18,
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
                          if (_formKey.currentState.validate()) {
                            print("Logou");
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
      ),
    );
  }
}
