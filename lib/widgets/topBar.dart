import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hora_salao/globals.dart';

class TopBar extends StatefulWidget {
  final bool forgetPassButton, arrow;
  final String text;

  const TopBar({
    @required this.forgetPassButton,
    this.text,
    this.arrow = true,
  });

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.transparent,//white, //darkGrey,
        // border: Border(
        //   bottom: BorderSide(
        //     color: this.widget.text != null ? white : Colors.transparent,
        //     width: this.widget.text != null ? 0.515 : 0.0,
        //   ),
        // ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: this.widget.text == null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
              children: [
                this.widget.arrow
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          FontAwesome5.arrow_left,
                          color: mainTextColor, //Color(0xFFdaa520),
                        ),
                      )
                    : SizedBox(),
                this.widget.text != null
                    ? SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      )
                    : Container(),
                this.widget.text != null
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            this.widget.text,
                            style: TextStyle(
                              color: mainTextColor, //Color(0xFFdaa520),
                              fontSize: MediaQuery.of(context).size.width * 0.06,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                this.widget.forgetPassButton
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/forgotPassword");
                        },
                        child: Center(
                          child: Container(
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(
                                color: mainTextColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
