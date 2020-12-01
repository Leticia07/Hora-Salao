import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/controllers/reservation.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/views/editReservation.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:intl/intl.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  ReservationController reservationController = new ReservationController();
  var reservations = [];

  @override
  void initState() {
    loadAgenda();
    super.initState();
  }

  Future loadAgenda() async {
    if (tipoUsuario == "cliente") {
      await reservationController.readOne(cliente.emailPessoa).then((value) {
        setState(() {
          reservations = value;
        });
      });
    } else if (tipoUsuario == "salao") {
      await reservationController.readOne(salao.emailSalao).then((value) {
        setState(() {
          reservations = value;
        });
      });
    } else {
      await reservationController.readOne(profissional.emailPessoa).then((value) {
        setState(() {
          reservations = value;
        });
      });
    }
  }

  String formatDate(d) {
    DateTime date = DateFormat("yyyy-MM-dd hh:mm:ss").parse(d);
    return "${date.day}/${date.month}/${date.year} às ${date.hour}:${date.minute}";
  }

  List<Widget> cards() {
    List<Widget> result = new List<Widget>();

    for (var i = 0; i < reservations.length; i++) {
      setState(() {
        result.add(
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        );
        result.add(
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditReservation(doc: reservations[i])));
            },
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 1, //0.5, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 10  horizontally
                          5.0, //MediaQuery.of(context).size.height * 0.005, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                    //color: mainBgColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "${reservations[i].data()['nomeSalao']}",
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
                            "${formatDate(reservations[i].data()['day'])}",
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 16.0,
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
                            "Valor total: R\$ ${reservations[i].data()['total']}",
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
              ],
            ),
          ),
        );
        if (i == reservations.length - 1) {
          result.add(
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          );
        }
      });
    }

    return result;
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
              text: "Seus Horários",
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView(
                children: [
                  Column(
                    children: cards(),
                  ),
                ],
              ),
            ),
            BottomBar(
              screen: 2,
            ),
          ],
        ),
      ),
    );
  }
}
