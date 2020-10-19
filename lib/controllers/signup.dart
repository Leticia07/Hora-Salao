
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hora_salao/globals.dart';

class Signup {

  void signupProfissional(info) {

  }

  Future signupSalao(info) async {

    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: info['email'], password: info['senha']).then((value) async {

      if (value != null) {

        await Firestore.instance.collection(collectionSalao).document(info['email']).setData({
          "name": info["nome"],
          "cnpj" : info["CPF"],
          "phone": info["telefone"],
          "email": info["email"],
          "zip code": info["CEP"], 
          "street": info["rua"],
          "number": info["numero"],
          "neighborhood": info["bairro"],
          "city": info["cidade"],
          "uf": info["estado"]
        });

      } else {
        return false;
      }

    });

    return true;

  }

  Future signupCliente(info) async {

    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: info['email'], password: info['senha']).then((value) async {

      if (value != null) {

        await Firestore.instance.collection(collectionCliente).document(info['email']).setData({
          "name": info["nome"],
          "cpf" : info["CPF"],
          "phone": info["telefone"],
          "email": info["email"],
          "zip code": info["CEP"], 
          "street": info["rua"],
          "number": info["numero"],
          "neighborhood": info["bairro"],
          "city": info["cidade"],
          "uf": info["estado"]
        });

      } else {
        return false;
      }

    });

    return true;

  }

}