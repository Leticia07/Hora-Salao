import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class TopBar extends StatefulWidget {
  final bool forgetPassButton;

  const TopBar({
    @required this.forgetPassButton,
  });

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  FontAwesome5.arrow_left,
                ),
              ),
              this.widget.forgetPassButton
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Container(
                          child: Text("Esqueci minha senha"),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
