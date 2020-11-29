import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/cliente.dart';
import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/models/salao.dart';
import 'package:hora_salao/models/servicos.dart';

class Person {
  Future readOne(email) async {
    try {
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
            // servicos.docs.map((e) {
            //   Servicos s = new Servicos(e.id, e['value']);
            //   salao.addServico(s);
            // });
          }
          // if (salaoDoc.data()['servicos'] != null && salaoDoc.data()['servicos'].length > 0) {
          //   for (int i = 0; i < salaoDoc.data()['servicos'].length; i++) {
          //     Servicos s = new Servicos(salaoDoc.data()['servicos'][i], 0.0);
          //     salao.addServico(s);
          //   }
          // }
          tipoUsuario = "salao";
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
    } on PlatformException catch (e) {
      print(e);
      return false;
    } on Exception catch (e) {
      return false;
    }
    return true;
  }

  Future update() async {
    try {
      if (tipoUsuario == "cliente") {
        await FirebaseFirestore.instance.collection(collectionCliente).doc(cliente.emailPessoa).update({
          "name": cliente.nomePessoa,
          "cpf": cliente.cpfPessoa,
          "phone": cliente.telefonePessoa,
          "zip code": cliente.endereco.cep,
          "street": cliente.endereco.rua,
          "number": cliente.endereco.numero,
          "neighborhood": cliente.endereco.bairro,
          "city": cliente.endereco.cidade,
          "uf": cliente.endereco.estado,
        });
      } else if (tipoUsuario == "salao") {
        await FirebaseFirestore.instance.collection(collectionSalao).doc(salao.emailSalao).update({
          "name": salao.nomeSalao,
          "cnpj": salao.cnpjSalao,
          "phone": salao.telefoneSalao,
          "zip code": salao.endereco.cep,
          "street": salao.endereco.rua,
          "number": salao.endereco.numero,
          "neighborhood": salao.endereco.bairro,
          "city": salao.endereco.cidade,
          "uf": salao.endereco.estado,
        });
      } else if (tipoUsuario == "profissional") {
        await FirebaseFirestore.instance.collection(collectionCliente).doc(profissional.emailPessoa).update({
          "name": profissional.nomePessoa,
          "cpf": profissional.cpfPessoa,
          "phone": profissional.telefonePessoa,
          "zip code": profissional.endereco.cep,
          "street": profissional.endereco.rua,
          "number": profissional.endereco.numero,
          "neighborhood": profissional.endereco.bairro,
          "city": profissional.endereco.cidade,
          "uf": profissional.endereco.estado,
        });
      }

      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
