import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hora_salao/globals.dart';
import 'package:intl/intl.dart';

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
    if (tipoUsuario == "cliente") {
      var reservation = await FirebaseFirestore.instance.collection("horarios").where('cliente', isEqualTo: email).get();

      return reservation.docs;
    } else if (tipoUsuario == "salao") {
      var reservation = await FirebaseFirestore.instance.collection("horarios").where('salao', isEqualTo: email).get();

      return reservation.docs;
    } else {
      var reservation = await FirebaseFirestore.instance.collection("horarios").where('profissional', isEqualTo: email).get();

      return reservation.docs;
    }
  }

  Future delete(docId) async {
    await FirebaseFirestore.instance.collection("horarios").doc(docId).delete();

    return true;
  }

  Future summary() async {
    Map summaryInfo = new Map();
    var email = "";

    if (tipoUsuario == "cliente") {
      email = cliente.emailPessoa;
    } else if (tipoUsuario == "salao") {
      email = salao.emailSalao;
    }
    
    var reservations;
    await readOne(email).then((value) {
      reservations = value;
    });

    var numberOfReservations = 0, total = 0.0, biggestValue = -1.0;

    summaryInfo['services'] = [];

    reservations.forEach((v) {
      var date = DateFormat("yyyy-MM-dd hh:mm:ss").parse(v.data()['day']);
      if (date.month == DateTime.now().month && date.year == DateTime.now().year) {
        numberOfReservations++;
        total += v.data()['total'];
        v.data()['servicos'].forEach((k, services) {
          if (summaryInfo[k] == null) {
            summaryInfo[k] = services['valor'];
          } else {
            summaryInfo[k] += services['valor'];
          }
          if (biggestValue < summaryInfo[k]) {
            biggestValue = summaryInfo[k];
            summaryInfo["biggestInvestiment"] = k;
          }
          if (!summaryInfo['services'].contains(k)) {
            summaryInfo['services'].add(k);
          }
        });
      }
    });

    summaryInfo['numberOfReservations'] = numberOfReservations;
    summaryInfo['total'] = total;

    print(summaryInfo);
    return summaryInfo;
  }
}
