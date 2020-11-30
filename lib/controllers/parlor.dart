import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hora_salao/globals.dart';

class Parlor {
  Future read() async {
    var docs = await FirebaseFirestore.instance.collection(collectionSalao).get();

    return docs.docs;
  }

  Future readServices(email) async {
    var servicosDoc = await FirebaseFirestore.instance.collection(collectionSalao).doc(email).collection("servicos").get();
    var servicos = [];
    if (servicosDoc != null) {
      for (var i = 0; i < servicosDoc.docs.length; i++) {
        servicos.add({"name": servicosDoc.docs[i].id, "value": servicosDoc.docs[i].data()['value'].toString()});
      }
    }

    return servicos;
  }
}
