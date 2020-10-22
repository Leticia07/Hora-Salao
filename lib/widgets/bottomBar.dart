import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:hora_salao/globals.dart';

class BottomBar extends StatefulWidget {

  final int screen;

  BottomBar({
    @required this.screen,
  }); 

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: black,
            width: 0.15,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
              child: Column(
                children: [
                  Icon(
                    FontAwesome5.search,
                    size: 20,
                    color: this.widget.screen == 1 ? softRed : black,
                  ),
                  Text(
                    "Explorar",
                    style: TextStyle(
                      color: black,
                      fontSize: 12.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/agenda");
              },
              child: Column(
                children: [
                  Icon(
                    FontAwesome5.calendar_times,
                    size: 20,
                    color: this.widget.screen == 2 ? softRed : black,
                  ),
                  Text(
                    "Horários",
                    style: TextStyle(
                      color: black,
                      fontSize: 12.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (tipoUsuario != "salao") {
                  Navigator.pushNamed(context, "/messages");
                } else {
                  Navigator.pushNamed(context, "/profissionais");
                }
              },
              child: Column(
                children: [
                  Icon(
                    tipoUsuario != "salao" ? FontAwesome.chat : FontAwesome5.users,
                    size: 20,
                    color: this.widget.screen == 3 ? softRed : black,
                  ),
                  Text(
                    tipoUsuario != "salao" ? "Mensagens" : "Profissionais",
                    style: TextStyle(
                      color: black,
                      fontSize: 12.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/perfil");
              },
              child: Column(
                children: [
                  Icon(
                    FontAwesome5.user_circle,
                    size: 20,
                    color: this.widget.screen == 4 ? softRed : black,
                  ),
                  Text(
                    "Perfil",
                    style: TextStyle(
                      color: black,
                      fontSize: 12.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
