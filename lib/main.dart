import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/views/agenda.dart';
import 'package:hora_salao/views/editServices.dart';
import 'package:hora_salao/views/home.dart';
import 'package:hora_salao/views/EditPerfil.dart';
import 'package:hora_salao/views/initialScreen.dart';
import 'package:hora_salao/views/login.dart';
import 'package:hora_salao/views/forgotPassword.dart';
import 'package:hora_salao/views/summary.dart';
import 'package:hora_salao/views/newProfessional.dart';
import 'package:hora_salao/views/newService.dart';
import 'package:hora_salao/views/professional.dart';
import 'package:hora_salao/views/signup.dart';
import 'package:hora_salao/views/splashScreen.dart';
import 'package:hora_salao/views/perfil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/forgotPassword': (context) => ForgotPasswordPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
        '/editPerfil': (context) => EditPerfilPage(),
        '/perfil': (context) => PerfilPage(),
        '/agenda': (context) => Agenda(),
        '/summary': (context) => Summary(),
        '/profissionais': (context) => Professional(),
        '/newProfessional': (context) => NewProfessional(),
        '/editServices': (context) => EditServices(),
        '/newService': (context) => NewService(),
      },
    );
  }
}
