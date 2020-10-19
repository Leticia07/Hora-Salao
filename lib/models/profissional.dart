

import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/pessoa.dart';
import 'package:hora_salao/models/servicos.dart';

class Profissional extends Pessoa {

  DateTime inicioHorario;
  DateTime fimHorario;
  List<Servicos> servicos = new List<Servicos>();

  Profissional(nome, email, telefone, cpf, endereco, inicio, fim) : super(nome, email, telefone, cpf, endereco) {
    this.inicioHorario = inicio;
    this.fimHorario = fim;
  }

  void addServico (servico) {
    servicos.add(servico);
  }

}