import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/views/editService.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/topBar.dart';

class EditServices extends StatefulWidget {
  @override
  _EditServicesState createState() => _EditServicesState();
}

class _EditServicesState extends State<EditServices> {
  final _formKey = GlobalKey<FormState>();

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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TopBar(
                forgetPassButton: false,
                text: "Editar Serviços",
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
                      Navigator.pushNamed(context, "/newService");
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
                        "Novo Serviço",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.63,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: salao.servicos.length,
                      itemBuilder: (context, index) {
                        var doc = salao.servicos[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditService(service: doc)));
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
                                          doc.nomeServico,
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
                                          "Valor: R\$ ${doc.valor}",
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
                              index == salao.servicos.length - 1
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
