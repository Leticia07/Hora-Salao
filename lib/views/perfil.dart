import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:hora_salao/widgets/bottomBar.dart';

import '../globals.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  var info = {};

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: mainBgColor,//mainBgColor,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          FontAwesome5.user,
                                          color: mainTextColor,
                                          size: MediaQuery.of(context).size.width * 0.1,
                                        ),
                                        radius: MediaQuery.of(context).size.width * 0.1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.02,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.68,
                                      child: Text(
                                        tipoUsuario == "cliente" ? cliente.nomePessoa : tipoUsuario == "salao" ? salao.nomeSalao : profissional.nomePessoa,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          color: mainTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            "Configurações",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: mainTextColor,//mainTextColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/editPerfil");
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height * 0.02,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Informações Pessoais",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        color: mainTextColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.person,
                                      size: 25,
                                      color: mainTextColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/agenda");
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height * 0.02,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Meus Horários",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        color: mainTextColor,
                                      ),
                                    ),
                                    Icon(
                                      FontAwesome5.calendar_alt,
                                      size: 25,
                                      color: mainTextColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      tipoUsuario == "salao" ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ) : SizedBox(),
                      tipoUsuario == "salao" ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/editServices");
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height * 0.02,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Meus Serviços",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        color: mainTextColor,
                                      ),
                                    ),
                                    Icon(
                                      FontAwesome.scissors,
                                      size: 25,
                                      color: mainTextColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) : SizedBox(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: GestureDetector(
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacementNamed(context, "/initialScreen");
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height * 0.02,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sair da conta",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        color: mainTextColor,
                                      ),
                                    ),
                                    Icon(
                                      FontAwesome5.sign_out_alt,
                                      size: 25,
                                      color: mainTextColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BottomBar(
              screen: 4,
            ),
          ],
        ),
      ),
    );
  }
}
