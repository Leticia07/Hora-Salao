import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/cliente.dart';
import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/models/salao.dart';

class Person {
  Future readOne(email) async {
    var client = await Firestore.instance.collection(collectionCliente).document(email).get();

    if (client.data != null) {
      Endereco end = new Endereco(
        client.data['street'],
        client.data['city'],
        client.data['uf'],
        client.data['neighborhood'],
        client.data['cep'],
        client.data['number']
      );

      cliente = new Cliente(client.data['name'], client.data['email'], client.data['phone'], client.data["cpf"], end);
      tipoUsuario = "cliente";
    } else {
      var salaoDoc = await Firestore.instance.collection(collectionSalao).document(email).get();

      if (salaoDoc.data != null) {
        Endereco end = new Endereco(salaoDoc.data['street'], salaoDoc.data['city'], salaoDoc.data['uf'], salaoDoc.data['neighborhood'], salaoDoc.data['cep'], salaoDoc.data['number']);

        salao = new Salao(salaoDoc.data['name'], salaoDoc.data['email'], salaoDoc.data['phone'], salaoDoc.data["cnpj"], end);
        tipoUsuario = "salao";
      } else {
        var profissionalDoc = await Firestore.instance.collection(collectionProfissional).document(email).get();

        if (profissionalDoc.data == null) {
          return false;
        }

        Endereco end = new Endereco(profissionalDoc.data['street'], profissionalDoc.data['city'], profissionalDoc.data['uf'], profissionalDoc.data['neighborhood'], profissionalDoc.data['cep'], profissionalDoc.data['number']);

        profissional = new Profissional(profissionalDoc.data['name'], profissionalDoc.data['email'], profissionalDoc.data['phone'], profissionalDoc.data["cpf"], end, profissionalDoc.data['begin'], profissionalDoc.data['end']);
        tipoUsuario = "profissional";
      }
    }
    return true;
  }

  Future update() async {
    try {
      if (tipoUsuario == "cliente") {
        await Firestore.instance.collection(collectionCliente).document(cliente.emailPessoa).updateData({
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
        await Firestore.instance.collection(collectionSalao).document(salao.emailSalao).updateData({
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
        await Firestore.instance.collection(collectionCliente).document(profissional.emailPessoa).updateData({
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
