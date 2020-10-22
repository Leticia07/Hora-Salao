import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:hora_salao/controllers/signup.dart';

import '../globals.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool isClient = false;
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                        color: darkGrey,
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
                        color: darkGrey,
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
                    Text("Cliente"),
                    Switch(
                        value: isClient,
                        onChanged: (bool valor) {
                          setState(() {
                            isClient = valor;
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
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: !isClient ? "000.000.000-00" : "00.000.000.0000-00",
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
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "(00) 90000-0000",
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
                            labelText: "CEP",
                            labelStyle: TextStyle(
                              color: darkGrey,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "00000-000",
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
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
                              info["senha"] = input;
                            })
                          },
                        ),
                      ),
                      isClient
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            )
                          : SizedBox(),
                      isClient
                          ? FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  "Os serviços aparecerão quando um cliente acessar o perfil do seu salão",
                                  style: TextStyle(
                                    color: darkGrey,
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
                      isClient
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            )
                          : SizedBox(),
                      isClient
                          ? FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  "Os serviços devem estar separados por vírgulas",
                                  style: TextStyle(
                                    color: darkGrey,
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
                      isClient
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            )
                          : SizedBox(),
                      isClient
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Serviços",
                                  labelStyle: TextStyle(
                                    color: darkGrey,
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  hintText: "Cabelo, unhas",
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
                                    info["servicos"] = input;
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
                                if (!isClient) {
                                  signupController.signupCliente(info).then((value) {
                                    if (value) {
                                      Fluttertoast.showToast(msg: "Usuário cadastrado com sucesso");
                                      Navigator.pushNamed(context, "/login");
                                    } else {
                                      Fluttertoast.showToast(msg: "Erro ao tentar cadastrar usuário!");
                                    }
                                  });
                                } else {
                                  signupController.signupSalao(info).then((value) {
                                    if (value) {
                                      Fluttertoast.showToast(msg: "Salão cadastrado com sucesso");
                                      Navigator.pushNamed(context, "/login");
                                    } else {
                                      Fluttertoast.showToast(msg: "Erro ao tentar cadastrar salão!");
                                    }
                                  });
                                }
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
