
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hora_salao/globals.dart';

class Parlor {

  Future read() async{

    var docs = await FirebaseFirestore.instance.collection(collectionSalao).get();

    return docs;

  }

}