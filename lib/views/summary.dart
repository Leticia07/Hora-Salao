import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hora_salao/controllers/reservation.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  ReservationController reservationController = new ReservationController();
  String month;
  Map completeSummary;

  @override
  void initState() {
    initializeDateFormatting('pt_Br');
    setState(() {
      month = DateFormat(DateFormat.MONTH, 'pt_Br').format(DateTime.now());
    });
    reservationController.summary().then((value) {
      setState(() {
        completeSummary = value;
      });
    });
    super.initState();
  }

  List<Widget> servicos() {
    List<Widget> result = new List<Widget>();

    for (var i = 0; i < completeSummary['services'].length; i++) {
      result.add(
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              "${completeSummary['services'][i]}: R\$ ${completeSummary[completeSummary['services'][i]]}",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      );
      result.add(
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      );
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
              text: "Resumo ${DateTime.now().year}",
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
                            "Resumo do mês: $month",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          completeSummary == null || completeSummary.isEmpty
                              ? Positioned(
                                  child: Center(
                                    child: Loading(),
                                  ),
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.03,
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        child: Text(
                                          "Número de agendamentos: ${completeSummary['numberOfReservations']}",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w300,
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
                                          "Valor Total: R\$ ${completeSummary['total']}",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w300,
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
                                          "Serviço de maior valor: ${completeSummary['biggestInvestiment']}",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w300,
                                          ),
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
                                          "Valor total por serviço:",
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
                                    Column(
                                      children: servicos(),
                                    ),
                                  ],
                                ),
                        ],
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
