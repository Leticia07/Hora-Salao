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
              child: ListView(
                children: [
                  Column(
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
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          itemCount: salao.profissionais.length,
                          itemBuilder: (context, index) {
                            return Text(salao.profissionais[index].nomePessoa);
                          },
                        ),
                      ),
                    ],
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
