import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/signup.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:intl/intl.dart';

class NewProfessional extends StatefulWidget {
  @override
  _NewProfessionalState createState() => _NewProfessionalState();
}

class _NewProfessionalState extends State<NewProfessional> {
  final _formKey = GlobalKey<FormState>();
  bool isClient = false;
  var info = {};
  final format = DateFormat("hh:mm a");
  Signup signupController = new Signup();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: mainBgColor,
          child: Column(
            children: [
              TopBar(
                forgetPassButton: false,
                text: "Novo Profissional",
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
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
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.38,
                                      child: DateTimeField(
                                        decoration: const InputDecoration(
                                          labelText: "Horário de Início",
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
                                        onSaved: (input) => {
                                          _formKey.currentState.setState(() {
                                            info["beginHour"] = input.hour;
                                          })
                                        },
                                        format: format,
                                        onShowPicker: (context, currentValue) async {
                                          final time = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                          );
                                          return DateTimeField.convert(time);
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.38,
                                      child: DateTimeField(
                                        decoration: const InputDecoration(
                                          labelText: "Horário de Término",
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
                                        onSaved: (input) => {
                                          _formKey.currentState.setState(() {
                                            info["endHour"] = input.hour;
                                          })
                                        },
                                        format: format,
                                        onShowPicker: (context, currentValue) async {
                                          final time = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                          );
                                          return DateTimeField.convert(time);
                                        },
                                      ),
                                    ),
                                  ],
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
                                        // signupController.signupProfessional(info).then((value) {
                                        //   if (value) {
                                        //     Fluttertoast.showToast(msg: "Profissional cadastrado com sucesso");
                                        //     Navigator.pop(context);
                                        //   } else {
                                        //     Fluttertoast.showToast(msg: "Erro ao tentar cadastrar profissional!");
                                        //   }
                                        // });
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
              BottomBar(
                screen: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
