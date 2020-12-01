import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/reservation.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/widgets/bottomBar.dart';
import 'package:hora_salao/widgets/loading.dart';
import 'package:hora_salao/widgets/topBar.dart';

class AllocateProfessional extends StatefulWidget {
  final QueryDocumentSnapshot doc;

  AllocateProfessional({
    this.doc,
  });

  @override
  _AllocateProfessionalState createState() => _AllocateProfessionalState();
}

class _AllocateProfessionalState extends State<AllocateProfessional> {
  ReservationController reservationController = new ReservationController();
  final _formKey = GlobalKey<FormState>();
  bool isClient = false, loading = false;
  var info = {};

  @override
  void initState() {
    setState(() {
      info['id'] = this.widget.doc.id;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: mainBgColor,
              child: Column(
                children: [
                  TopBar(
                    forgetPassButton: false,
                    text: "Alocar Profissional",
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: "Email",
                                        labelStyle: TextStyle(
                                          color: darkGrey,
                                        ),
                                        contentPadding: EdgeInsets.all(0),
                                        hintText: "profissional@gmail.com",
                                        hintStyle: TextStyle(
                                          color: mainTextColor,
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w300,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: darkGrey,
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: darkGrey,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 14,
                                        letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                        fontFamily: 'Roboto',
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          Fluttertoast.showToast(msg: "Insira um Email");
                                          return "";
                                        }
                                      },
                                      onChanged: (value) => {
                                        _formKey.currentState.save(),
                                      },
                                      onSaved: (input) => {
                                        _formKey.currentState.setState(() {
                                          info["email"] = input;
                                        })
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.05,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: FlatButton(
                                        padding: EdgeInsets.only(
                                          bottom: 20,
                                        ),
                                        onPressed: () async {
                                          _formKey.currentState.save();
                                          if (_formKey.currentState.validate()) {
                                            setState(() {
                                              loading = true;
                                            });
                                            reservationController.update(info).then((value) {
                                              setState(() {
                                                loading = false;
                                              });
                                              Fluttertoast.showToast(msg: "Profissional alocado!");
                                              Navigator.pushReplacementNamed(context, "/agenda");
                                            });
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: darkGrey,
                                            border: Border.all(
                                              color: Color(0xFFA3A3A372),
                                            ),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          height: 44,
                                          width: 142,
                                          child: Text(
                                            "Alocar",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BottomBar(
                    screen: null,
                  ),
                ],
              ),
            ),
          ),
          loading
              ? Positioned(
                  child: Loading(),
                )
              : Container(),
        ],
      ),
    );
  }
}
