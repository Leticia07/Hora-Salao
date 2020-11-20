import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowSalao extends StatefulWidget {
  final salao;

  ShowSalao({
    @required this.salao,
  });

  @override
  _ShowSalaoState createState() => _ShowSalaoState();
}

class _ShowSalaoState extends State<ShowSalao> {

  @override
  void initState() {
    //print(this.widget.salao);
    super.initState();
  }

  List<Widget> servicos() {
    List<Widget> servicos = new List<Widget>();

    if (this.widget.salao['servicos'] == null || this.widget.salao['servicos'].length == 0) {
      return [Container()];
    }

    for (int i = 0; i < this.widget.salao['servicos'].length; i++) {
      servicos.add(
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      );
      servicos.add(
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              "${this.widget.salao['servicos'][i]}",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
    }

    return servicos;
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
        color: mainBgColor,
        child: Column(
          children: [
            TopBar(
              forgetPassButton: false,
              text: this.widget.salao['name'],
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
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "CNPJ: ${this.widget.salao['cnpj']}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "Endereço:",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "${this.widget.salao['street']}, ${this.widget.salao['number']}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "Bairro ${this.widget.salao['neighborhood']} - CEP: ${this.widget.salao['zip code']}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "${this.widget.salao['city']}, ${this.widget.salao['uf']}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "Serviços:",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: servicos(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "Entre em contato:",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: FlatButton(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  onPressed: () async {
                                    var whatsappUrl = "whatsapp://send?phone=${this.widget.salao['phone'].toString()}";
                                    await canLaunch(whatsappUrl) ? launch(whatsappUrl) : print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                                    //await FlutterOpenWhatsapp.sendSingleMessage(this.widget.salao['phone'].toString(), "");
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
                                    width: 130,
                                    child: Text(
                                      "WhatsApp",
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
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: FlatButton(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  onPressed: () async {
                                    var emailUrl = "mailto:${this.widget.salao['email'].toString()}?subject='Contato do App Hora do salão'&body=''";
                                    await canLaunch(emailUrl) ? await launch(emailUrl) : print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
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
                                    width: 130,
                                    child: Text(
                                      "Email",
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
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
    );
  }
}
