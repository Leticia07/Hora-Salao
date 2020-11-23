import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/controllers/parlor.dart';
import 'package:hora_salao/controllers/professional.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/views/showSalao.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/homeParlor.dart';
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
          parlors = value.documents;
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: darkGrey,
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
                  tipoUsuario == "salao"
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.78,
                          child: ListView(
                            children: [
                              HomeParlor(),
                            ],
                          ))
                      : Container(),
                  tipoUsuario == "cliente" ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: ListView.builder(
                      itemCount: parlors.length,
                      itemBuilder: (context, index) {
                        var doc = parlors[index].data;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ShowSalao(salao: doc)));
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10.0, // soften the shadow
                                      spreadRadius: 0.5, //extend the shadow
                                      offset: Offset(
                                        5.0, // Move to right 10  horizontally
                                        MediaQuery.of(context).size.height * 0.005, // Move to bottom 5 Vertically
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        child: Text(
                                          doc["name"],
                                          style: TextStyle(
                                            color: darkGrey,
                                            fontSize: 20.0,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Raleway',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.02,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        child: Text(
                                          "${doc["neighborhood"]} - ${doc['zip code']}",
                                          style: TextStyle(
                                            color: darkGrey,
                                            fontSize: 14.0,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Raleway',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        child: Text(
                                          "${doc["city"]} - ${doc['uf']}",
                                          style: TextStyle(
                                            color: darkGrey,
                                            fontSize: 14.0,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Raleway',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              index == parlors.length - 1
                                  ? SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.05,
                                    )
                                  : SizedBox()
                            ],
                          ),
                        );
                      },
                    ),
                  ) : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
            BottomBar(
              screen: 1,
            ),
          ],
        ),
      ),
    );
  }
}
