import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(
          bottom: 70.0,
        ),
        marginDescription: EdgeInsets.only(
          top: 230.0,
        ),
        widgetDescription: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  "Reserve seu horário no seu salão favorito com um só toque!",
                  style: TextStyle(
                    color: white,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Raleway',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        backgroundImage: 'lib/assets/images/salao1.jpg',
      ),
    );
    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(
          bottom: 70.0,
        ),
        marginDescription: EdgeInsets.only(
          top: 230.0,
        ),
        widgetDescription: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  "Obtenha os registros dos seus horários e ofereça seus serviços de forma rápida e eficiente!",
                  style: TextStyle(
                    color: white,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Raleway',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        backgroundImage: 'lib/assets/images/salao2.jpg',
      ),
    );
    slides.add(
      new Slide(
        marginDescription: EdgeInsets.only(
          top: 130.0,
        ),
        widgetDescription: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  "Aproveite!",
                  style: TextStyle(
                    color: white,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Raleway',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    color: darkGrey,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: white,//Color(0xFFdaa520),
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Raleway',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    color: darkGrey,
                    child: Center(
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(
                          color: white,//Color(0xFFdaa520),
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Raleway',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundImage: 'lib/assets/images/salao3.jpg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new IntroSlider(
      // List slides
      slides: this.slides,
      // Button
      isShowSkipBtn: false,
      isShowDoneBtn: false,
      isShowNextBtn: false,
      // Dot indicator
      colorDot: darkGrey,
      colorActiveDot: white,
      sizeDot: 13.0,
      // Tabs
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },
      // Show or hide status bar
      shouldHideStatusBar: true,
    );
  }
}
