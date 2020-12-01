import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hora_salao/controllers/reservation.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'indicator.dart';
import 'package:random_color/random_color.dart';

class HomeParlor extends StatefulWidget {
  @override
  _HomeParlorState createState() => _HomeParlorState();
}

class _HomeParlorState extends State<HomeParlor> {
  ReservationController reservationController = new ReservationController();
  Map completeSummary;
  int touchedIndex;
  RandomColor _randomColor = RandomColor();
  Map selectedColors = new Map();

  @override
  void initState() {
    reservationController.summary().then((value) {
      setState(() {
        completeSummary = value;
      });
      generateColors();
    });
    super.initState();
  }

  void generateColors() {
    for (var i = 0; i < completeSummary['services'].length; i++) {
      Color _color = _randomColor.randomColor();
      setState(() {
        selectedColors[completeSummary['services'][i]] = _color;
      });
    }
  }

  List<Widget> indicators() {
    List<Widget> result = new List<Widget>();

    selectedColors.forEach((key, value) {
      result.add(
        Indicator(
          color: value,
          text: key,
          isSquare: true,
        ),
      );
      result.add(
        SizedBox(
          height: 10,
        ),
      );
    });

    result.add(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        completeSummary == null || completeSummary.isEmpty
            ? Positioned(
                child: Center(
                  child: Loading(),
                ),
              )
            : Column(
                children: [
                  AspectRatio(
                    aspectRatio: 0.9,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                                    setState(() {
                                      if (pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd) {
                                        touchedIndex = -1;
                                      } else {
                                        touchedIndex = pieTouchResponse.touchedSectionIndex;
                                      }
                                    });
                                  }),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: showingSections(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: indicators(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    List<PieChartSectionData> section = new List<PieChartSectionData>();
    //final isTouched = i == touchedIndex;
    final double fontSize = 16; //isTouched ? 25 : 16;
    final double radius = 50; //isTouched ? 60 : 50;

    selectedColors.forEach((key, value) {
      section.add(
        PieChartSectionData(
          color: value,
          value: completeSummary[key] * 100 / completeSummary['total'],
          title: '${completeSummary[key] * 100 / completeSummary['total']}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        ),
      );
    });
    return section;
  }
}
