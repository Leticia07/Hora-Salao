import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundImage extends StatefulWidget {
  final bool hasOpacity;

  BackgroundImage({
    this.hasOpacity = false,
  });

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage('lib/assets/images/salao1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: new Container(
          decoration: new BoxDecoration(
            color: this.widget.hasOpacity ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}
