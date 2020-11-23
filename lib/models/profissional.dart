

import 'package:hora_salao/models/pessoa.dart';
import 'package:hora_salao/models/servicos.dart';

class Profissional extends Pessoa {

  double inicioHorario;
  double fimHorario;
  List<Servicos> servicos = new List<Servicos>();

  Profissional(nome, email, telefone, cpf, endereco, inicio, fim) : super(nome, email, telefone, cpf, endereco) {
    this.inicioHorario = double.parse(inicio.toString());
    this.fimHorario = double.parse(fim.toString());
  }

  void addServico (servico) {
    servicos.add(servico);
  }

}