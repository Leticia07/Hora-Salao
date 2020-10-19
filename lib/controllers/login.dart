
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/cliente.dart';
import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/models/salao.dart';

class Login {

  Future login(email, password) async {

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {

      if (value != null) {

        user = value.user;

        var client = await Firestore.instance.collection(collectionCliente).document(email).get();

        if (client.data != null) {

          Endereco end = new Endereco(client.data['street'], client.data['city'], client.data['uf'], client.data['neighborhood'], client.data['cep'], int.parse(client.data['number']));

          cliente = new Cliente(client.data['name'], client.data['email'], client.data['phone'], client.data["cpf"], end);

        } else {

          var salaoDoc = await Firestore.instance.collection(collectionSalao).document(email).get();

          if (salaoDoc.data != null) {

            Endereco end = new Endereco(salaoDoc.data['street'], salaoDoc.data['city'], salaoDoc.data['uf'], salaoDoc.data['neighborhood'], salaoDoc.data['cep'], int.parse(salaoDoc.data['number']));

            salao = new Salao(salaoDoc.data['name'], salaoDoc.data['email'], salaoDoc.data['phone'], salaoDoc.data["cnpj"], end);

          } else {

            var profissionalDoc = await Firestore.instance.collection(collectionProfissional).document(email).get();

            if (profissionalDoc.data == null) {
              return false;
            }

            Endereco end = new Endereco(profissionalDoc.data['street'], profissionalDoc.data['city'], profissionalDoc.data['uf'], profissionalDoc.data['neighborhood'], profissionalDoc.data['cep'], int.parse(profissionalDoc.data['number']));

            profissional = new Profissional(profissionalDoc.data['name'], profissionalDoc.data['email'], profissionalDoc.data['phone'], profissionalDoc.data["cpf"], end, profissionalDoc.data['begin'], profissionalDoc.data['end']);

          }

        }

      } else {
        return false;
      }

    });

    return true;
  }

}