import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:project_flut/Dashboard.dart';
import 'package:project_flut/component/identite.dart';

// List<String> _listes1 = <String>[
//   'Types des chambre a reserver                   ',
//   'class2                                   ',
//   'class3                                   ',
//   'class4                                   ',
// ];

// List<String> _listes2 = <String>[
//   "Qualité de lappartement                              ",
//   'STANDARD',
//   'VIP'
// ];

// List<String> _listes3 = <String>[
//   "Numéro de l'appartement                             ",
//   '001',
//   '002',
//   '003',
//   '004',
//   '005',
// ];

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);
  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  DateTime? datechoose;
  // String dropdownValue = _listes1.first;
  String? valeur;
  // String dropdownValue2 = _listes2.first;
  // String dropdownValue3 = _listes3.first;

  // String Unitialvalues1 = "Types des chambre a reserver                   ";

  // String Unitialvalues2 =
  //     "Qualité de lappartement                              ";

  // String Unitialvalues3 =
  //     "Numéro de l'appartement                             ";

//---------------LES CONTROLLERS CLIENTS-------------------

  TextEditingController txtName = TextEditingController();
  TextEditingController txtAdresse = TextEditingController();
  TextEditingController txtTelephone = TextEditingController();

//--------------LES CONTROLERS RESRVATION--------------

  TextEditingController txtDelait = new TextEditingController();
  TextEditingController txtPrix = new TextEditingController();
  // TextEditingController newValue1 = new TextEditingController();
  // TextEditingController txtTelephone = TextEditingController();

  //-------------methode Post-------------

  Future<void> saveData1() async {
    try {
      var url = "http://192.168.18.186:8080/etudiant/post.php";

      var response = await http.post(Uri.parse(url), body: {
        "nomClient": txtName.text,
        "adresseClient": txtAdresse.text,
        "telephoneClient": txtTelephone.text
      });
      debugPrint(response.body.toString());
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> saveData2() async {
    try {
      debugPrint({
        "nomClient": txtName.text,
        "typechambre": valeur,
        "delaitresrvation": txtDelait.text,
        "prixreservation": txtPrix.text,
        // "numerochambre": txtAdresse.text,
        // "qualitechambre": txtTelephone.text,
        "daterervation": datechoose.toString(),
      }.toString());
      var rqt = "http://192.168.18.186:8080/etudiant/postResrvation.php";
      var response = await http.post(Uri.parse(rqt), body: {
        "nomClient": txtName.text,
        "typechambre": valeur,
        "delaitresrvation": txtDelait.text,
        "prixreservation": txtPrix.text,
        // "numerochambre": txtAdresse.text,
        // "qualitechambre": txtTelephone.text,
        "daterervation": datechoose.toString(),
      });
      debugPrint(response.body.toString());
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leadingWidth: 45.0,
          centerTitle: true,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
          title: Text("F A I T E S  LA  R E S E R V A T I O N"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Column(
                children: [
                  Text(
                    "Identité du client",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 17,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(height: 30),
                  Identite_client(),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 90.0, vertical: 5.0),
                  //     child: TextField(
                  //       controller: txtName,
                  //       keyboardType: TextInputType.visiblePassword,
                  //       decoration: InputDecoration(
                  //         labelText: "Nom du client",
                  //         fillColor: Colors.grey.shade200,
                  //         filled: true,
                  //       ),
                  //     )),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 90.0, vertical: 5.0),
                  //     child: TextField(
                  //       controller: txtAdresse,
                  //       keyboardType: TextInputType.visiblePassword,
                  //       decoration: InputDecoration(
                  //         labelText: "Adresse",
                  //         fillColor: Colors.grey.shade200,
                  //         filled: true,
                  //       ),
                  //     )),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 90.0, vertical: 5.0),
                  //     child: TextField(
                  //       controller: txtTelephone,
                  //       keyboardType: TextInputType.visiblePassword,
                  //       decoration: InputDecoration(
                  //         labelText: "Numéro de télephone",
                  //         fillColor: Colors.grey.shade200,
                  //         filled: true,
                  //       ),
                  //     )),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //           child: Divider(
                  //               thickness: 0.5, color: Colors.grey[400])),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //         child: Text(
                  //           "Categorie des appartements",
                  //           style: TextStyle(
                  //             color: Colors.grey[700],
                  //             fontWeight: FontWeight.w100,
                  //             fontSize: 17,
                  //           ),
                  //         ),
                  //       ),
                  //       Expanded(
                  //           child: Divider(
                  //         thickness: 0.5,
                  //         color: Colors.grey[400],
                  //       ))
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  //   width: 0,
                  // ),
                  // Calculatrice(),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 90.0, vertical: 5.0),
                  //   child: DropdownButton<String>(
                  //     // dropdownColor: Colors.grey,
                  //     value: dropdownValue,
                  //     underline: Container(
                  //       height: 2,
                  //       color: Colors.grey[400],
                  //     ),
                  //     onChanged: (String? newValue1) {
                  //       setState(() {
                  //         dropdownValue = newValue1!;
                  //         valeur = dropdownValue.toString();
                  //         print(valeur);
                  //       });
                  //     },
                  //     items:
                  //         _listes1.map<DropdownMenuItem<String>>((var value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(
                  //           value,
                  //           style: TextStyle(color: Colors.grey.shade700),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     isExpanded: false,
                  //     hint: Text("Choisissez le type de l'appartement"),
                  //   ),
                  // ),

                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 90.0, vertical: 5.0),
                  //   child: DropdownButton<String>(
                  //     value: dropdownValue2,
                  //     underline: Container(
                  //       height: 2,
                  //       color: Colors.grey[400],
                  //     ),
                  //     onChanged: (String? newValue2) {
                  //       setState(() {
                  //         dropdownValue2 = newValue2!;
                  //       });
                  //     },
                  //     items:
                  //         _listes2.map<DropdownMenuItem<String>>((var value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(
                  //           value,
                  //           style: TextStyle(color: Colors.grey.shade700),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     isExpanded: false,
                  //     hint: Text("okkkk"),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 90.0, vertical: 5.0),
                  //   child: DropdownButton<String>(
                  //     value: dropdownValue3,
                  //     underline: Container(
                  //       height: 2,
                  //       color: Colors.grey[400],
                  //     ),
                  //     onChanged: (String? newValue2) {
                  //       setState(() {
                  //         dropdownValue3 = newValue2!;
                  //       });
                  //     },
                  //     items:
                  //         _listes2.map<DropdownMenuItem<String>>((var value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(
                  //           value,
                  //           style: TextStyle(color: Colors.grey.shade700),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     isExpanded: false,
                  //     hint: Text("okkkk"),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 90.0, vertical: 5.0),
                  //   child: DropdownButton<String>(
                  //     value: Unitialvalues3,
                  //     underline: Container(
                  //       height: 2,
                  //       color: Colors.grey[400],
                  //     ),
                  //     onChanged: (String? newValue3) {
                  //       setState(() {
                  //         Unitialvalues2 = newValue3!;
                  //       });
                  //     },
                  //     items:
                  //         _listes3.map<DropdownMenuItem<String>>((var valeur) {
                  //       return DropdownMenuItem<String>(
                  //         value: valeur,
                  //         child: Text(
                  //           valeur,
                  //           style: TextStyle(color: Colors.grey.shade700),
                  //         ),
                  //       );
                  //     }).toList(),
                  //     isExpanded: false,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30.0,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //           child: Divider(
                  //               thickness: 0.5, color: Colors.grey[400])),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //         child: Text(
                  //           "Delait et prix",
                  //           style: TextStyle(
                  //             color: Colors.grey[700],
                  //             fontWeight: FontWeight.w100,
                  //             fontSize: 17,
                  //           ),
                  //         ),
                  //       ),
                  //       Expanded(
                  //           child: Divider(
                  //         thickness: 0.5,
                  //         color: Colors.grey[400],
                  //       ))
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30.0,
                  // ),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 90.0, vertical: 5.0),
                  //     child: TextField(
                  //       controller: txtDelait,
                  //       keyboardType: TextInputType.visiblePassword,
                  //       decoration: InputDecoration(
                  //         labelText: "Delait de la reservation",
                  //         fillColor: Colors.grey.shade200,
                  //         filled: true,
                  //       ),
                  //     )),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 90.0, vertical: 5.0),
                  //     child: TextField(
                  //       controller: txtPrix,
                  //       keyboardType: TextInputType.visiblePassword,
                  //       decoration: InputDecoration(
                  //         labelText: "Prix pour la reservation",
                  //         fillColor: Colors.grey.shade200,
                  //         filled: true,
                  //       ),
                  //     )),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(datechoose == null
                  //         ? "Date de reservation"
                  //         : DateFormat("yyyy-MM-dd").format(datechoose!)),
                  //     TextButton(
                  //         onPressed: () {
                  //           showDatePicker(
                  //                   context: context,
                  //                   initialDate: DateTime.now(),
                  //                   firstDate: DateTime(2024),
                  //                   lastDate: DateTime.now())
                  //               .then((valeur) {
                  //             if (valeur == null) {
                  //               return;
                  //             }

                  //             setState(() => {datechoose = valeur});
                  //             print(datechoose);
                  //           });
                  //         },
                  //         child: const Text("choose")),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 70.0, vertical: 15.0),
                  //   child: Center(
                  //     child: RaisedButton(
                  //       onPressed: () {
                  //         // saveData2();
                  //         saveData1();
                  //       },
                  //       mouseCursor: MouseCursor.defer,
                  //       color: Colors.blueAccent,
                  //       child: Text(
                  //         "Enregistré",
                  //         style: TextStyle(
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w100,
                  //             color: Colors.white),
                  //       ),
                  //       padding: EdgeInsets.symmetric(
                  //           horizontal: 140.0, vertical: 25.5),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 100.0,
                  // ),
                ],
              )
            ],
          ),
        ));
  }
}
