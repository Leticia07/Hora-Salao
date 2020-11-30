import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/controllers/reservation.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/topBar.dart';

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
    await reservationController.readOne(cliente.emailPessoa).then((value) {
      setState(() {
        reservations = value;
      });
      print(reservations[0].data());
    });
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
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ],
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
