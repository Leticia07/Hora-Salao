// Here we put all variables we'll gonna use on our app
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hora_salao/models/cliente.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/models/salao.dart';

const Color darkGrey = Color(0xFF2d2d2d);
const Color white = Color(0xFFFFFFFF);

const Color mainBgColor = Color(0xFFFFFFFF);
const Color mainTextColor = Color(0xFF2d2d2d);
const Color black = Color(0xFF000000);
const Color softRed = Color(0xFFf5776e);

String collectionCliente = "clientes";
String collectionSalao = "saloes";
String collectionProfissional = "profissionais";
FirebaseUser user; 
Cliente cliente;
Salao salao;
Profissional profissional;
String tipoUsuario;
