import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/controllers/parlor.dart';
import 'package:hora_salao/controllers/professional.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/backgroundImage.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/homeParlor.dart';
import 'package:hora_salao/widgets/parlorCard.dart';
import 'package:hora_salao/widgets/topBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Parlor parlorController = new Parlor();
  Professional professionalController = new Professional();
  var parlors = [], professionals = [];

  @override
  void initState() {
    if (tipoUsuario == "cliente") {
      loadParlors().then((value) {
        setState(() {
          parlors = value;
        });
      });
    } else if (tipoUsuario == "salao") {
      loadProfessionals().then((value) {
        setState(() {
          professionals = value;
        });
      });
    }
    super.initState();
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushReplacementNamed(context, "/initialScreen");
    }
  }

  Future loadParlors() async {
    return await parlorController.read();
  }

  Future loadProfessionals() async {
    return await professionalController.read();
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
            child: BackgroundImage(),
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ), //darkGrey,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TopBar(
                          arrow: false,
                          forgetPassButton: false,
                          text: tipoUsuario == "cliente"
                              ? "Salões disponíveis"
                              : tipoUsuario == "salao"
                                  ? salao.nomeSalao
                                  : profissional.nomePessoa,
                        ),
                        tipoUsuario == "salao" || tipoUsuario == "profissional"
                            ? Container(
                                width: MediaQuery.of(context).size.width * 1,
                                height: MediaQuery.of(context).size.height * 0.8,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: ListView(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.01,
                                    ),
                                    HomeParlor(),
                                  ],
                                ))
                            : Container(),
                        tipoUsuario == "cliente"
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.8,
                                //color: white, //Colors.transparent,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: ListView.builder(
                                  itemCount: parlors.length,
                                  itemBuilder: (context, index) {
                                    Map doc = parlors[index].data();
                                    //return Container();
                                    return ParlorCard(doc, index, parlors);
                                  },
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  BottomBar(
                    screen: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
