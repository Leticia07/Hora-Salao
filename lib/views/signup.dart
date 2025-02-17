import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/views/signup1.dart';
import 'package:hora_salao/widgets/backgroundImage.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:hora_salao/controllers/signup.dart';

import '../globals.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool isClient = false, loading = false;
  var info = {};
  Signup signupController = new Signup();

  @override
  void initState() {
    super.initState();
    setState(() {
      isClient = false;
    });
  }

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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            child: ListView(
              children: [
                Column(
                  children: [
                    TopBar(
                      forgetPassButton: false,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "É muito bom te ter conosco!",
                          style: TextStyle(
                            color: black,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Raleway',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Que serviço devemos te oferecer?",
                          style: TextStyle(
                            color: black,
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Raleway',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cliente",
                          style: TextStyle(color: black),
                        ),
                        Switch(
                            value: isClient,
                            onChanged: (bool valor) {
                              setState(() {
                                isClient = valor;
                              });
                            }),
                        Text(
                          "Salão",
                          style: TextStyle(color: black),
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Nome",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: "Fulano da Silva",
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
                                color: white,
                                fontSize: 14,
                                letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                fontFamily: 'Roboto',
                              ),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  Fluttertoast.showToast(msg: "Insira um Nome");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  info["nome"] = input;
                                })
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: !isClient ? "CPF" : "CNPJ",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: !isClient ? "000.000.000-00" : "00.000.000.0000-00",
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
                                color: white,
                                fontSize: 14,
                                letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                fontFamily: 'Roboto',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  Fluttertoast.showToast(msg: "Insira um CPF");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  info["CPF"] = input;
                                })
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Telefone",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: "(00) 90000-0000",
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
                                color: white,
                                fontSize: 14,
                                letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                fontFamily: 'Roboto',
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value.isEmpty) {
                                  Fluttertoast.showToast(msg: "Insira um Telefone");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  info["telefone"] = input;
                                })
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "E-mail",
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
                                color: white,
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
                                  info["email"] = input;
                                })
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
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
                                color: white,
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
                                  info["senha"] = input;
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
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup1Page(info: info, isClient: isClient,)));
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: black,
                                    border: Border.all(
                                      color: black,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: 44,
                                  width: 142,
                                  child: Text(
                                    "Continuar",
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