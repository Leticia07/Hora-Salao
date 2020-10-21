import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/controllers/person.dart';
import 'package:hora_salao/globals.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Person personController = new Person();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    loadUser().then((value) {
      if (value != null) {
        user = value;
        
        personController.readOne(user.email).then((value) {
          if (value) {
            Future.delayed(Duration(seconds: 3)).then((_) {
              Navigator.pushReplacementNamed(context, "/home");
            });
          } else {
            Future.delayed(Duration(seconds: 3)).then((_) {
              Navigator.pushReplacementNamed(context, "/initialScreen");
            });
          }
        });
      } else {
        Future.delayed(Duration(seconds: 3)).then((_) {
          Navigator.pushReplacementNamed(context, "/initialScreen");
        });
      }
    });
  }

  Future loadUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Container(
      color: darkGrey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset('lib/assets/images/logo.jpg'),
        ),
      ),
    );
  }
}
