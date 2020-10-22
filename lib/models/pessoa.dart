

import 'package:hora_salao/models/endereco.dart';

class Pessoa {
  String nomePessoa;
  String emailPessoa;
  String telefonePessoa;
  String cpfPessoa;
  Endereco endereco;

  Pessoa(nome, email, telefone, cpf, endereco) {
    this.nomePessoa = nome.toString();
    this.emailPessoa = email.toString();
    this.telefonePessoa = telefone.toString();
    this.cpfPessoa = cpf.toString();
    this.endereco = endereco;
  }
}