import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/signup.dart';
import 'package:hora_salao/widgets/backgroundImage.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:hora_salao/widgets/loading.dart';
import '../globals.dart';

class Signup2Page extends StatefulWidget {

  var info;
  bool isClient;
  Signup2Page(this.info, this.isClient);

  @override
  _Signup2PageState createState() => _Signup2PageState();
}

class _Signup2PageState extends State<Signup2Page> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  Signup signupController = new Signup();

   @override
  Widget build(BuildContext context) {
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
                            "Agora Vamos ao seu endereço!",
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
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
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
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
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
                                    widget.info["telefone"] = input;
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
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
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
                                    widget.info["CEP"] = input;
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
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
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
                                    widget.info["rua"] = input;
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
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
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
                                    widget.info["numero"] = input;
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
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
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
                                    widget.info["bairro"] = input;
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
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
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
                                    widget.info["cidade"] = input;
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
                                    color: darkGrey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: white,
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
                                    widget.info["estado"] = input;
                                  })
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: FlatButton(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
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
                                      "Cadastrar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: darkGrey,
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      if (!widget.isClient) {
                                        signupController.signupCliente(widget.info).then((value) {
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
                                        signupController.signupSalao(widget.info).then((value) {
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
                                ),
                              ),
                            ),
                          ]
                        )
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