import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/reservation.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:intl/intl.dart';

class Reservation extends StatefulWidget {
  final salao;
  final services;

  Reservation({
    this.salao,
    this.services,
  });

  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  double total = 0.0;
  Map reservationInfo = new Map();
  bool loading = false;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  ReservationController reservationController = new ReservationController();

  @override
  void initState() {
    reservationInfo["cliente"] = cliente.emailPessoa;
    reservationInfo["salao"] = this.widget.salao["email"];
    reservationInfo["nomeSalao"] = this.widget.salao["name"];
    reservationInfo["servicos"] = new Map();
    super.initState();
  }

  List<Widget> servicos() {
    List<Widget> servicos = new List<Widget>();

    if (this.widget.services == null || this.widget.services.length == 0) {
      return [Container()];
    }

    for (int i = 0; i < this.widget.services.length; i++) {
      servicos.add(
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      );
      servicos.add(
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${this.widget.services[i]['name']} - R\$ ${double.tryParse(this.widget.services[i]['value'])}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FlatButton(
                      // padding: EdgeInsets.only(
                      //   bottom: 20,
                      // ),
                      onPressed: () async {
                        if (reservationInfo.isEmpty || reservationInfo['servicos'][this.widget.services[i]['name']] == null) {
                          setState(() {
                            reservationInfo["servicos"][this.widget.services[i]['name']] = {'valor': double.tryParse(this.widget.services[i]['value'])};
                            total += double.tryParse(this.widget.services[i]['value']);
                          });
                        } else {
                          setState(() {
                            reservationInfo["servicos"].remove(this.widget.services[i]['name']);
                            total -= double.tryParse(this.widget.services[i]['value']);
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: reservationInfo.isEmpty || reservationInfo['servicos'][this.widget.services[i]['name']] == null ? darkGrey : Colors.grey,
                          border: Border.all(
                            color: Color(0xFFA3A3A372),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 30,
                        width: 130,
                        child: Text(
                          reservationInfo.isEmpty || reservationInfo['servicos'][this.widget.services[i]['name']] == null ? "Selecionar" : "Selecionado",
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
                  text: "Reserva: ${this.widget.salao['name']}",
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
                                "Serviços disponíveis:",
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: DateTimeField(
                                decoration: const InputDecoration(
                                  labelText: "Dia e Hora",
                                  labelStyle: TextStyle(
                                    color: darkGrey,
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: darkGrey,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: darkGrey,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                onSaved: (input) => {
                                  reservationInfo["day"] = input.toString(),
                                },
                                onChanged: (input) {
                                  reservationInfo["day"] = input.toString();
                                },
                                format: format,
                                onShowPicker: (context, currentValue) async {
                                  final date = await showDatePicker(context: context, firstDate: DateTime.now(), initialDate: currentValue ?? DateTime.now(), lastDate: DateTime.now().add(new Duration(days: 365)));
                                  if (date != null) {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                    );
                                    return DateTimeField.combine(date, time);
                                  } else {
                                    return currentValue;
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Total: R\$ $total",
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
                                  if (total != 0.0 && reservationInfo["day"] != null) {
                                    reservationInfo['total'] = total;
                                    reservationInfo['profissional'] = "";
                                    reservationController.create(reservationInfo).then((value) {
                                      setState(() {
                                        loading = false;
                                      });
                                      Fluttertoast.showToast(msg: "Reserva realizada com sucesso");
                                      Navigator.pushReplacementNamed(context, '/agenda');
                                    });
                                  } else {
                                    Fluttertoast.showToast(msg: "Selecione as informações antes de confirmar");
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: total == 0.0 ? Colors.grey : darkGrey,
                                    border: Border.all(
                                      color: total == 0.0 ? Colors.grey : Color(0xFFA3A3A372),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: 44,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    "Confirmar Reserva",
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
