import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationController {
  Future create(info) async {
    var docId;

    await FirebaseFirestore.instance.collection("horarios").add({
      "cliente": info['cliente'],
      "salao": info['salao'],
      "nomeSalao": info['nomeSalao'],
      "profissional": info['profissional'],
      "servicos": info['servicos'],
      "day": info['day'],
      "total": info['total'],
    }).then((value) {
      docId = value.id;
      print(docId);
    });

    return true;
  }

  Future readOne(email) async {
    var reservation = await FirebaseFirestore.instance.collection("horarios").where('cliente', isEqualTo: email).get();

    return reservation.docs;
  }

  Future delete(docId) async {
    await FirebaseFirestore.instance.collection("horarios").doc(docId).delete();

    return true;
  }
}
