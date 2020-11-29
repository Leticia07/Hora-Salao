import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/controllers/professional.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowProfessional extends StatefulWidget {
  final Profissional professional;

  ShowProfessional({
    @required this.professional,
  });

  @override
  _ShowProfessionalState createState() => _ShowProfessionalState();
}

class _ShowProfessionalState extends State<ShowProfessional> {
  bool loading = false;
  Professional professionalController = new Professional();

  @override
  void initState() {
    if (this.widget.professional != null && this.widget.professional.cpfPessoa.isEmpty) {
      AlertDialog(
        title: Text("O cadastro desse profissional ainda não foi finalizado!"),
        actions: [],
      );
    }

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
        color: mainBgColor,
        child: Column(
          children: [
            TopBar(
              forgetPassButton: false,
              text: this.widget.professional.nomePessoa,
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
                            "CPF: ${this.widget.professional.cpfPessoa}",
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
                            "${this.widget.professional.endereco.rua}, ${this.widget.professional.endereco.numero}",
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
                            "Bairro ${this.widget.professional.endereco.bairro} - CEP: ${this.widget.professional.endereco.cep}",
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
                            "${this.widget.professional.endereco.cidade}, ${this.widget.professional.endereco.estado}",
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
                      // FittedBox(
                      //   fit: BoxFit.scaleDown,
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width * 0.8,
                      //     child: Text(
                      //       "Serviços:",
                      //       style: TextStyle(
                      //         fontSize: 18.0,
                      //         fontFamily: 'Roboto',
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Column(
                      //   children: servicos(),
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.05,
                      // ),
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
                                    var whatsappUrl = "whatsapp://send?phone=${this.widget.professional.telefonePessoa.toString()}";
                                    await canLaunch(whatsappUrl) ? launch(whatsappUrl) : print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                                    //await FlutterOpenWhatsapp.sendSingleMessage(this.widget.professional['phone'].toString(), "");
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
                                    var emailUrl = "mailto:${this.widget.professional.emailPessoa.toString()}?subject='Contato do App Hora do salão'&body=''";
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
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.02,
                      // ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.8,
                      //   child: Align(
                      //     alignment: Alignment.bottomLeft,
                      //     child: FlatButton(
                      //       padding: EdgeInsets.only(
                      //         bottom: 20,
                      //       ),
                      //       onPressed: () async {
                      //         setState(() {
                      //           loading = true;
                      //         });
                      //         professionalController.delete(this.widget.professional).then((value) {
                      //           if (value) {
                      //             Fluttertoast.showToast(msg: "Serviço removido com sucesso");
                      //             Navigator.pushReplacementNamed(context, '/profissionais');
                      //           } else {
                      //             Fluttertoast.showToast(msg: "Erro ao tentar remover serviço!");
                      //           }
                      //           setState(() {
                      //             loading = false;
                      //           });
                      //         });
                      //       },
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         decoration: BoxDecoration(
                      //           color: Colors.red,
                      //           border: Border.all(
                      //             color: Color(0xFFA3A3A372),
                      //           ),
                      //           borderRadius: BorderRadius.circular(5),
                      //         ),
                      //         height: 44,
                      //         width: 142,
                      //         child: Text(
                      //           "Excluir",
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //             color: white,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
