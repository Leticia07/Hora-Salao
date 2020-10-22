import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/login.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/topBar.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  Login loginController = new Login();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: mainBgColor,
        child: ListView(
          children: [
            Column(
              children: [
                TopBar(
                  forgetPassButton: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "Insira seu email",
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
                            labelText: "Email",
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
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FlatButton(
                            padding: EdgeInsets.only(
                              bottom: 20,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                loginController.resetPassword(_email).then((value) {
                                  if (value) {
                                    Navigator.pushReplacementNamed(context, "/login");
                                    Fluttertoast.showToast(msg: "Email de atualização de senha enviado!");
                                  } else {
                                    Fluttertoast.showToast(msg: "Erro ao tentar resetar senha!");
                                  }
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
                                "Resetar Senha",
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
