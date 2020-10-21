import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/widgets/topBar.dart';

import '../globals.dart';

class EditPerfilPage extends StatefulWidget {
  @override
  _EditPerfilPageState createState() => _EditPerfilPageState();
}

class _EditPerfilPageState extends State<EditPerfilPage> {
  final _formKey = GlobalKey<FormState>();
  bool isClient;
  var info = {};

  @override
  void initState() {
    setState(() {
      isClient = true;
    });
    super.initState();
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
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                FontAwesome5.user,
                                color: black,
                                size: MediaQuery.of(context).size.width * 0.12,
                              ),
                              radius: MediaQuery.of(context).size.width * 0.2,
                            ),
                          ),
                        ),
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
                          initialValue: cliente.emailPessoa,
                          enabled: false,
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
                              cliente.emailPessoa = input;
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
                          initialValue: cliente.nomePessoa,
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
                              cliente.nomePessoa = input;
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
                          initialValue: cliente.cpfPessoa,
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
                              cliente.cpfPessoa = input;
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
                          initialValue: cliente.telefonePessoa,
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
                              cliente.telefonePessoa = input;
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
                          initialValue: cliente.cpfPessoa,
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
                              cliente.cpfPessoa = input;
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
                          initialValue: cliente.endereco.rua,
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
                              cliente.endereco.rua = input;
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
                          initialValue: cliente.endereco.numero.toString(),
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
                              cliente.endereco.numero = int.tryParse(input);
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
                          initialValue: cliente.endereco.bairro,
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
                              cliente.endereco.bairro = input;
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
                          initialValue: cliente.endereco.cidade,
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
                              cliente.endereco.cidade = input;
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
                          initialValue: cliente.endereco.estado,
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
                              cliente.endereco.estado = input;
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
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                
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
                                "Atualizar Perfil",
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
