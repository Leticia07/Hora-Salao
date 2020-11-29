import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/cliente.dart';
import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/models/salao.dart';
import 'package:hora_salao/models/servicos.dart';

class Login {
  Future login(email, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        if (value != null) {
          user = value.user;

          var client = await FirebaseFirestore.instance.collection(collectionCliente).doc(email).get();

          if (client.data() != null) {
            Endereco end = new Endereco(client.data()['street'], client.data()['city'], client.data()['uf'], client.data()['neighborhood'], client.data()['zip code'], client.data()['number'].toString());

            cliente = new Cliente(client.data()['name'], client.data()['email'], client.data()['phone'], client.data()["cpf"], end);
            tipoUsuario = "cliente";
          } else {
            var salaoDoc = await FirebaseFirestore.instance.collection(collectionSalao).doc(email).get();

            if (salaoDoc.data() != null) {
              Endereco end = new Endereco(salaoDoc.data()['street'], salaoDoc.data()['city'], salaoDoc.data()['uf'], salaoDoc.data()['neighborhood'], salaoDoc.data()['zip code'], salaoDoc.data()['number'].toString());

              salao = new Salao(salaoDoc.data()['name'], salaoDoc.data()['email'], salaoDoc.data()['phone'], salaoDoc.data()["cnpj"], end);
              var servicos = await FirebaseFirestore.instance.collection(collectionSalao).doc(salaoDoc.data()['email']).collection("servicos").get();
              if (servicos != null) {
                for (var i = 0; i < servicos.docs.length; i++) {
                  Servicos s = new Servicos(servicos.docs[i].id.toString(), servicos.docs[i].data()['value'].toDouble());
                  salao.addServico(s);
                }
              }
              // if (salaoDoc.data()['servicos'] != null && salaoDoc.data()['servicos'].length > 0) {
              //   for (int i = 0; i < salaoDoc.data()['servicos'].length; i++) {
              //     Servicos s = new Servicos(salaoDoc.data()['servicos'][i], 0.0);
              //     salao.addServico(s);
              //   }
              // }
              tipoUsuario = "salao";

              if (salaoDoc.data()['profissionais'] != null) {
                print(salaoDoc.data()['profissionais']);
              }
            } else {
              var profissionalDoc = await FirebaseFirestore.instance.collection(collectionProfissional).doc(email).get();

              if (profissionalDoc.data() == null) {
                return false;
              }

              Endereco end = new Endereco(profissionalDoc.data()['street'], profissionalDoc.data()['city'], profissionalDoc.data()['uf'], profissionalDoc.data()['neighborhood'], profissionalDoc.data()['zip code'], profissionalDoc.data()['number'].toString());

              profissional = new Profissional(profissionalDoc.data()['name'], profissionalDoc.data()['email'], profissionalDoc.data()['phone'], profissionalDoc.data()["cpf"], end, profissionalDoc.data()['begin'], profissionalDoc.data()['end']);
              tipoUsuario = "profissional";
            }
          }
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

  Future resetPassword(email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print("AA");
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
