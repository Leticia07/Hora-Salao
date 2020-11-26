// Here we put all variables we'll gonna use on our app
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hora_salao/models/cliente.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/models/salao.dart';

const Color darkGrey = Color(0xFF2d2d2d);
const Color white = Color(0xFFFFFFFF);

const Color mainBgColor = Color(0xFFFFFFFF);
const Color mainTextColor = Color(0xFF000000);
const Color black = Color(0xFF000000);
const Color softRed = Color(0xFFf5776e);

String collectionCliente = "clientes";
String collectionSalao = "saloes";
String collectionProfissional = "profissionais";
User user; 
Cliente cliente;
Salao salao;
Profissional profissional;
String tipoUsuario;

FirebaseOptions firebaseOptions = const FirebaseOptions(
  appId: '1:880867377976:android:3db97fa67482e2121db7cd',
  apiKey: 'AIzaSyCRVQOS1haM66t_R-oFZTrWhkUtzJEeVbg',
  projectId: 'hora-salao',
  messagingSenderId: '880867377976',
);
