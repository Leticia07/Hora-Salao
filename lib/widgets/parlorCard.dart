import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hora_salao/globals.dart';
import 'package:hora_salao/views/showSalao.dart';

class ParlorCard extends StatefulWidget {
  final Map doc;
  final int index;
  final List<QueryDocumentSnapshot> parlors;

  ParlorCard(
    this.doc,
    this.index,
    this.parlors,
  );

  @override
  _ParlorCardState createState() => _ParlorCardState();
}

class _ParlorCardState extends State<ParlorCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return Container();
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShowSalao(salao: this.widget.doc)));
      },
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 1, //0.5, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, //MediaQuery.of(context).size.height * 0.005, // Move to bottom 5 Vertically
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(20.0),
              //color: mainBgColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      this.widget.doc["name"],
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Raleway',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "${this.widget.doc["neighborhood"]} - ${this.widget.doc['zip code']}",
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Raleway',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "${this.widget.doc["city"]} - ${this.widget.doc['uf']}",
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Raleway',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          this.widget.index == this.widget.parlors.length - 1
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                )
              : SizedBox()
        ],
      ),
    );
  }
}
