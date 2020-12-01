import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/parlor.dart';
import 'package:hora_salao/controllers/person.dart';
import 'package:hora_salao/controllers/reservation.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class EditReservation extends StatefulWidget {
  final QueryDocumentSnapshot doc;

  EditReservation({
    this.doc,
  });

  @override
  _EditReservationState createState() => _EditReservationState();
}

class _EditReservationState extends State<EditReservation> {
  Parlor parlorController = new Parlor();
  Person personController = new Person();
  ReservationController reservationController = new ReservationController();
  var p;
  bool loading = false;

  @override
  void initState() {
    if (tipoUsuario != "salao") {
      parlorController.readOne(this.widget.doc.data()['salao']).then((value) {
        setState(() {
          p = value;
        });
      });
    } else {
      personController.readClient(this.widget.doc.data()['cliente']).then((value) {
        setState(() {
          p = value;
        });
      });
    }
    super.initState();
  }

  List<Widget> servicos() {
    List<Widget> servicos = new List<Widget>();

    if (this.widget.doc.data()['servicos'] == null || this.widget.doc.data()['servicos'].length == 0) {
      return [Container()];
    }

    this.widget.doc.data()['servicos'].forEach((k, v) {
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
              "$k - R\$ ${this.widget.doc.data()['servicos'][k]['valor']}",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
    });

    return servicos;
  }

  String formatDate(d) {
    DateTime date = DateFormat("yyyy-MM-dd hh:mm:ss").parse(d);
    return "${date.day}/${date.month}/${date.year} às ${date.hour}:${date.minute}";
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: mainBgColor,
            child: Column(
              children: [
                TopBar(
                  forgetPassButton: false,
                  text: tipoUsuario != "salao" ? p != null ? "Reserva em: ${p['name']}" : "Reserva de: " : p != null ? "Reserva de: ${p['name'].toString().split(" ")[0]}" : "Reserva de: ",
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
                                "Código: ${this.widget.doc.id}",
                                style: TextStyle(
                                  fontSize: 16.0,
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
                                "Hora: ${formatDate(this.widget.doc.data()['day'])}",
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
                                this.widget.doc.data()['profissional'] == "" ? "Profissional: Não alocado" : "Profissional: ${this.widget.doc.data()['profissional']}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          tipoUsuario != "salao"
                              ? Column(
                                  children: [
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
                                          "${p['street']}, ${p['number']}",
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
                                          "Bairro ${p['neighborhood']} - CEP: ${p['zip code']}",
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
                                          "${p['city']}, ${p['uf']}",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
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
                                        var whatsappUrl = "whatsapp://send?phone=${p['phone'].toString()}";
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
                                        var emailUrl = "mailto:${p['email'].toString()}?subject='Contato do App Hora do salão'&body=''";
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: FlatButton(
                                padding: EdgeInsets.only(
                                  bottom: 20,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  reservationController.delete(this.widget.doc.id).then((value) {
                                    setState(() {
                                      loading = false;
                                    });
                                    Fluttertoast.showToast(msg: "Reserva cancelada!");
                                    Navigator.pushReplacementNamed(context, "/agenda");
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: 44,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    "Cancelar Reserva",
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
