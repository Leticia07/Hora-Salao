import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../globals.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool cliente;
  var info = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      cliente = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text("Cliente"),
                    Switch(
                        value: cliente,
                        onChanged: (bool valor) {
                          setState(() {
                            cliente = valor;
                          });
                        }),
                    Text("Salão"),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Nome",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "Fulano da Silva",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "CPF",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "000.000.000-00",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Telefone",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "(00) 90000-0000",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "E-mail",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.05,
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "CEP",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "00000-000",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                              info["CEP"] = input;
                            })
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Rua",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "Rua dos bobos",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                              info["rua"] = input;
                            })
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Número",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "Número 0",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                              info["numero"] = input;
                            })
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Bairro",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "Taiçoca",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                              info["bairro"] = input;
                            })
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Cidade",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "Tangamandápio",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                              info["cidade"] = input;
                            })
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Estado",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "Unido",
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                              info["estado"] = input;
                            })
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
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
                            letterSpacing:
                                MediaQuery.of(context).size.width * 0.002,
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
                                print("Cadastrou");
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
    );
  }
}
