import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/models/endereco.dart';
import 'package:hora_salao/models/profissional.dart';

class Professional {

  Future read() async {
    var docs = await FirebaseFirestore.instance.collection(collectionSalao).doc(salao.emailSalao).get();

    if (docs.data()['profissionais'] != null) {
      for (var i = 0; i < docs.data()['profissionais'].length; i++) {
        var doc = await FirebaseFirestore.instance.collection(collectionProfissional).doc(docs.data()['profissionais'][i]).get();

        Endereco end = new Endereco("", "", "", "", "", "");
        Profissional p = new Profissional(doc.data()["name"], doc.data()['email'], doc.data()["phone"], doc.data()["zip code"], end);// doc.data()['beginHour'], doc.data()['endHour']);

        salao.addProfissionais(p);
      }
      return salao.profissionais;
    }

    return [];
  }

  Future delete(Profissional p) async {
    if (secondaryApp == null) {
      secondaryApp = await Firebase.initializeApp(name: "secondaryApp", options: Firebase.app().options);
    }
    await FirebaseFirestore.instance.collection(collectionSalao).doc(salao.emailSalao).update({
      "profissionais": FieldValue.arrayRemove([p.nomePessoa]),
    });
    await FirebaseFirestore.instance.collection(collectionProfissional).doc(p.nomePessoa).delete().catchError((onError) {
      return false;
    });
    salao.profissionais.remove(p);
    return true;
  }
}
