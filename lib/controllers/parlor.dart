

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hora_salao/globals.dart';

class Parlor {

  Future read() async{

    var docs = await Firestore.instance.collection(collectionSalao).getDocuments();

    return docs;

  }

}