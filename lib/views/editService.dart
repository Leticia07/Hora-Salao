import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/servicos.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';

class EditService extends StatefulWidget {
  final Servicos service;

  EditService({
    this.service,
  });

  @override
  _EditServiceState createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
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
                    text: "${this.widget.service.nomeServico}",
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
                                      initialValue: this.widget.service.valor.truncate().toString(),
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
                                            serviceController.update(info, this.widget.service).then((value) {
                                              if (value) {
                                                Fluttertoast.showToast(msg: "Serviço atualizado com sucesso");
                                                Navigator.pop(context);
                                              } else {
                                                Fluttertoast.showToast(msg: "Erro ao tentar atualizar serviço!");
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
                                            "Atualizar",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.01,
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
                                            serviceController.delete(this.widget.service).then((value) {
                                              if (value) {
                                                Fluttertoast.showToast(msg: "Serviço removido com sucesso");
                                                Navigator.pushReplacementNamed(context, '/editServices');
                                              } else {
                                                Fluttertoast.showToast(msg: "Erro ao tentar remover serviço!");
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
                                            color: Colors.red,
                                            border: Border.all(
                                              color: Color(0xFFA3A3A372),
                                            ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          height: 44,
                                          width: 142,
                                          child: Text(
                                            "Excluir",
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
