import 'package:flutter/material.dart';
import 'package:hora_salao/globals.dart';

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(black),
        ),
      ),
      color: Colors.white.withOpacity(0.1),
    );
  }
}