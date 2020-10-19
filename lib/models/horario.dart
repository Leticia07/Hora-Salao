

import 'package:hora_salao/models/cliente.dart';
import 'package:hora_salao/models/profissional.dart';
import 'package:hora_salao/models/servicos.dart';

class Horario {

  Profissional profissional;
  Cliente cliente;
  List<Servicos> servicos = new List<Servicos>();
  DateTime horario;
  double valor;

  Horario(profissional, cliente, horario, valor) {
    this.profissional = profissional;
    this.cliente = cliente;
    this.horario = horario;
    this.valor = valor;
  }

  void addServico (servico) {
    this.servicos.add(servico);
  }

}