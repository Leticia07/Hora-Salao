import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/servicos.dart';

class Service {
  Future create(info) async {
    await FirebaseFirestore.instance.collection(collectionSalao).doc(salao.emailSalao).collection("servicos").doc(info['name']).set({
      'value': double.tryParse(info['value']),
    }).catchError((onError) {
      return false;
    });
    salao.addServico(new Servicos(info['name'], double.tryParse(info['value'])));
    return true;
  }

  Future update(info, Servicos service) async {
    await FirebaseFirestore.instance.collection(collectionSalao).doc(salao.emailSalao).collection("servicos").doc(service.nomeServico).update({
      'value': double.tryParse(info['value']),
    }).catchError((onError) {
      return false;
    });
    service.valor = double.tryParse(info['value']);
    return true;
  }

  Future delete(Servicos service) async {
    await FirebaseFirestore.instance.collection(collectionSalao).doc(salao.emailSalao).collection("servicos").doc(service.nomeServico).delete().catchError((onError) {
      return false;
    });
    salao.servicos.remove(service);
    return true;
  }
}
