

import 'package:hora_salao/models/endereco.dart';

class Pessoa {
  String nomePessoa;
  String emailPessoa;
  String telefonePessoa;
  String cpfPessoa;
  Endereco endereco;

  Pessoa(nome, email, telefone, cpf, endereco) {
    this.nomePessoa = nome;
    this.emailPessoa = email;
    this.telefonePessoa = telefone;
    this.cpfPessoa = cpf;
    this.endereco = endereco;
  }
}