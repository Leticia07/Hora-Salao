import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/views/home.dart';
import 'package:hora_salao/views/EditPerfil.dart';
import 'package:hora_salao/views/initialScreen.dart';
import 'package:hora_salao/views/login.dart';
import 'package:hora_salao/views/signup.dart';
import 'package:hora_salao/views/splashScreen.dart';
import 'package:hora_salao/views/perfil.dart';

void main() {
  runApp(
    DevicePreview(
      //enabled: !kReleaseMode,
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom,
      // SystemUiOverlay.top,
    ]);
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'Hora do Salão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/initialScreen': (context) => InitialScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
        '/editPerfil': (context) => EditPerfilPage(),
        '/perfil': (context) => PerfilPage(),
      },
    );
  }
}
