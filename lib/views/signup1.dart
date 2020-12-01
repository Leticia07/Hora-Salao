import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/widgets/backgroundImage.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:hora_salao/controllers/signup.dart';

import '../globals.dart';

class Signup1Page extends StatefulWidget {
  final info, isClient;

  Signup1Page({
    this.info,
    this.isClient,
  });

  @override
  _Signup1PageState createState() => _Signup1PageState();
}

class _Signup1PageState extends State<Signup1Page> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  Signup signupController = new Signup();

  @override
  void initState() {
    super.initState();
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
                          "Agora vamos ao seu endereço!",
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
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "CEP",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: "00000-000",
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
                                  Fluttertoast.showToast(msg: "Insira um CEP");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  this.widget.info["CEP"] = input;
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
                                labelText: "Rua",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: "Rua dos bobos",
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
                                  Fluttertoast.showToast(msg: "Insira uma rua");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  this.widget.info["rua"] = input;
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
                                labelText: "Número",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: "Número 0",
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
                                  Fluttertoast.showToast(msg: "Insira um Número");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  this.widget.info["numero"] = input;
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
                                labelText: "Bairro",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: "Taiçoca",
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
                                  Fluttertoast.showToast(msg: "Insira um Bairro");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  this.widget.info["bairro"] = input;
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
                                labelText: "Cidade",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: "Tangamandápio",
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
                                  Fluttertoast.showToast(msg: "Insira uma cidade");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  this.widget.info["cidade"] = input;
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
                                labelText: "Estado",
                                labelStyle: TextStyle(
                                  color: black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                hintText: "Unido",
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
                                  Fluttertoast.showToast(msg: "Insira um Estado");
                                  return "";
                                }
                              },
                              onChanged: (value) => {
                                _formKey.currentState.save(),
                              },
                              onSaved: (input) => {
                                _formKey.currentState.setState(() {
                                  this.widget.info["estado"] = input;
                                })
                              },
                            ),
                          ),
                          this.widget.isClient
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                )
                              : SizedBox(),
                          this.widget.isClient
                              ? FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      "Os serviços aparecerão quando um cliente acessar o perfil do seu salão",
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 18.0,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                )
                              : Container(),
                          this.widget.isClient
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                )
                              : SizedBox(),
                          this.widget.isClient
                              ? FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      "Os serviços devem estar separados por vírgulas",
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                )
                              : Container(),
                          this.widget.isClient
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                )
                              : SizedBox(),
                          this.widget.isClient
                              ? Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Serviços",
                                      labelStyle: TextStyle(
                                        color: black,
                                      ),
                                      contentPadding: EdgeInsets.all(0),
                                      hintText: "Cabelo, unhas",
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
                                        Fluttertoast.showToast(msg: "Insira seus serviços");
                                        return "";
                                      }
                                    },
                                    onChanged: (value) => {
                                      _formKey.currentState.save(),
                                    },
                                    onSaved: (input) => {
                                      _formKey.currentState.setState(() {
                                        this.widget.info["servicos"] = input;
                                      })
                                    },
                                  ),
                                )
                              : Container(),
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
                                    setState(() {
                                      loading = true;
                                    });
                                    if (!this.widget.isClient) {
                                      signupController.signupCliente(this.widget.info).then((value) {
                                        if (value) {
                                          Fluttertoast.showToast(msg: "Usuário cadastrado com sucesso");
                                          Navigator.pushReplacementNamed(context, "/login");
                                        } else {
                                          Fluttertoast.showToast(msg: "Erro ao tentar cadastrar usuário!");
                                        }
                                        setState(() {
                                          loading = false;
                                        });
                                      });
                                    } else {
                                      signupController.signupSalao(this.widget.info).then((value) {
                                        if (value) {
                                          Fluttertoast.showToast(msg: "Salão cadastrado com sucesso");
                                          Navigator.pushReplacementNamed(context, "/login");
                                        } else {
                                          Fluttertoast.showToast(msg: "Erro ao tentar cadastrar salão!");
                                        }
                                        setState(() {
                                          loading = false;
                                        });
                                      });
                                    }
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
                                    "Cadastrar",
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
