import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/profissional.dart';

class Signup {
  Future signupProfessional(info) async {
    try {
      FirebaseApp app = await Firebase.initializeApp(name: info['email'], options: Firebase.app().options);
      print(app);
      await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: info['email'], password: info['senha']).then((value) async {
        if (value != null) {
          await FirebaseFirestore.instanceFor(app: app).collection(collectionProfissional).doc(info['email']).set({"name": info["nome"], "cpf": info["CPF"], "phone": info["telefone"], "email": info["email"], "zip code": "", "street": "", "number": "", "neighborhood": "", "city": "", "uf": "", "beginHour": info['beginHour'], "endHour": info['endHour']});

          await FirebaseFirestore.instanceFor(app: app).collection(collectionSalao).doc(salao.emailSalao).update({
            "profissionais": FieldValue.arrayUnion([info['email']]),
          });

          Endereco end = new Endereco("", "", "", "", "", "");
          Profissional p = new Profissional(info["nome"], info['email'], info["telefone"], info["CPF"], end, info['beginHour'], info['endHour']);

          salao.addProfissionais(p);
        } else {
          return false;
        }
      });
      await app?.delete();
      return true;
    } on PlatformException catch (e) {
      print(e);
      return false;
    } on Exception catch (e) {
      return false;
    }
  }

  Future signupSalao(info) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: info['email'], password: info['senha']).then((value) async {
        if (value != null) {
          await FirebaseFirestore.instance.collection(collectionSalao).doc(info['email']).set({"name": info["nome"], "cnpj": info["CPF"], "phone": info["telefone"], "email": info["email"], "zip code": info["CEP"], "street": info["rua"], "number": info["numero"], "neighborhood": info["bairro"], "city": info["cidade"], "uf": info["estado"], "servicos": info["servicos"].toString().split(",")});
        } else {
          return false;
        }
      });
    } on PlatformException catch (e) {
      print(e);
      return false;
    } on Exception catch (e) {
      return false;
    }

    return true;
  }

  Future signupCliente(info) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: info['email'], password: info['senha']).then((value) async {
        if (value != null) {
          await FirebaseFirestore.instance.collection(collectionCliente).doc(info['email']).set({"name": info["nome"], "cpf": info["CPF"], "phone": info["telefone"], "email": info["email"], "zip code": info["CEP"], "street": info["rua"], "number": info["numero"], "neighborhood": info["bairro"], "city": info["cidade"], "uf": info["estado"]});
        } else {
          return false;
        }
      });
    } on PlatformException catch (e) {
      print(e);
      return false;
    } on Exception catch (e) {
      return false;
    }

    return true;
  }
}
