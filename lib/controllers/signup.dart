import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/profissional.dart';

class Signup {
  Future signupProfessional(info) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: info['email'], password: info['senha']).then((value) async {
        if (value != null) {
          await Firestore.instance.collection(collectionProfissional).document(info['email']).setData({"name": info["nome"], "cpf": info["CPF"], "phone": info["telefone"], "email": info["email"], "zip code": "", "street": "", "number": "", "neighborhood": "", "city": "", "uf": "", "beginHour": info['beginHour'], "endHour": info['endHour']});

          await Firestore.instance.collection(collectionSalao).document(salao.emailSalao).updateData({
            "profissionais": FieldValue.arrayUnion([info['email']]),
          });

          Endereco end = new Endereco("", "", "", "", "", "");
          Profissional p = new Profissional(info["nome"], info['email'], info["telefone"], info["CPF"], end, info['beginHour'], info['endHour']);

          salao.addProfissionais(p);
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

  Future signupSalao(info) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: info['email'], password: info['senha']).then((value) async {
        if (value != null) {
          await Firestore.instance.collection(collectionSalao).document(info['email']).setData({"name": info["nome"], "cnpj": info["CPF"], "phone": info["telefone"], "email": info["email"], "zip code": info["CEP"], "street": info["rua"], "number": info["numero"], "neighborhood": info["bairro"], "city": info["cidade"], "uf": info["estado"], "servicos": info["servicos"].toString().split(",")});
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
          await Firestore.instance.collection(collectionCliente).document(info['email']).setData({"name": info["nome"], "cpf": info["CPF"], "phone": info["telefone"], "email": info["email"], "zip code": info["CEP"], "street": info["rua"], "number": info["numero"], "neighborhood": info["bairro"], "city": info["cidade"], "uf": info["estado"]});
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
