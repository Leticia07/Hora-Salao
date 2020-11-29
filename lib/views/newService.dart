import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';

class NewService extends StatefulWidget {
  @override
  _NewServiceState createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  var info = {};
  Service serviceController = new Service();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: mainBgColor,
              child: Column(
                children: [
                  TopBar(
                    forgetPassButton: false,
                    text: "Novo Serviço",
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
                                        hintText: "Cabelos",
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
                                          info["name"] = input;
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
                                        labelText: "Valor",
                                        labelStyle: TextStyle(
                                          color: darkGrey,
                                        ),
                                        contentPadding: EdgeInsets.all(0),
                                        hintText: "50",
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
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      ],
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          Fluttertoast.showToast(msg: "Insira um Valor");
                                          return "";
                                        }
                                      },
                                      onChanged: (value) => {
                                        _formKey.currentState.save(),
                                      },
                                      onSaved: (input) => {
                                        _formKey.currentState.setState(() {
                                          info["value"] = input;
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
                                            serviceController.create(info).then((value) {
                                              if (value) {
                                                Fluttertoast.showToast(msg: "Serviço cadastrado com sucesso");
                                                Navigator.pop(context);
                                              } else {
                                                Fluttertoast.showToast(msg: "Erro ao tentar cadastrar serviço!");
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
                                            color: darkGrey,
                                            border: Border.all(
                                              color: Color(0xFFA3A3A372),
                                            ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          height: 44,
                                          width: 142,
                                          child: Text(
                                            "Adicionar",
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
