import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/topBar.dart';

class Professional extends StatefulWidget {
  @override
  _ProfessionalState createState() => _ProfessionalState();
}

class _ProfessionalState extends State<Professional> {
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
        child: Column(
          children: [
            TopBar(
              forgetPassButton: false,
              text: "Profissionais",
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
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
                          Navigator.pushNamed(context, "/newProfessional");
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
                          width: 200,
                          child: Text(
                            "Novo Profissional",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.63,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: salao.profissionais.length,
                      itemBuilder: (context, index) {
                        var doc = salao.profissionais[index];
                        return GestureDetector(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => ShowProfissional(profissional: doc)));
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
                                          doc.nomePessoa,
                                          style: TextStyle(
                                            color: black,
                                            fontSize: 20.0,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Raleway',
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.02,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        child: Text(
                                          "${doc.emailPessoa}",
                                          style: TextStyle(
                                            color: mainTextColor,
                                            fontSize: 14.0,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Raleway',
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        child: Text(
                                          "${doc.telefonePessoa}",
                                          style: TextStyle(
                                            color: mainTextColor,
                                            fontSize: 14.0,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Raleway',
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              index == salao.profissionais.length - 1
                                  ? SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.05,
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            BottomBar(
              screen: 3,
            ),
          ],
        ),
      ),
    );
  }
}
