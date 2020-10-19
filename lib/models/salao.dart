

import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/models/servicos.dart';

class Salao {
  String nomeSalao;
  String cnpjSalao;
  String emailSalao;
  String telefoneSalao;
  Endereco endereco;
  List<Servicos> servicos = new List<Servicos>();
  List<Profissional> profissionais = new List<Profissional>();

  Salao(nome, cnpj, email, telefone, endereco) {
    this.nomeSalao = nome;
    this.cnpjSalao = cnpj;
    this.emailSalao = email;
    this.telefoneSalao = telefone;
    this.endereco = endereco;
  }

  void addServico (servico) {
    this.servicos.add(servico);
  }

  void addProfissionais (profissional) {
    this.profissionais.add(profissional);
  }
}