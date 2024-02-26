import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_flut/Dashboard.dart';
import 'package:http/http.dart' as http;

List<String> _listes2 = <String>[
  "Qualité de lappartement                              ",
  'STANDARD',
  'VIP'
];

List<String> _listes3 = <String>[
  "Numéro de l'appartement                             ",
  '001',
  '002',
  '003',
  '004',
  '005',
];

class Categorie_client extends StatefulWidget {
  const Categorie_client({Key? key}) : super(key: key);

  @override
  State<Categorie_client> createState() => _Categorie_clientState();
}

class _Categorie_clientState extends State<Categorie_client> {
  DateTime? datechoose;
  DateTime? datechoose2;
  String? valeur;

  // String dropdownValue1 = _listes1.first;
  // String dropdownValue2 = _listes2.first;
  // String dropdownValue3 = _listes3.first;

  // String? dropdownValue1;
  String? dropdownValue2;
  String? dropdownValue3;
  var type;
  var numero;

  Future<void> saveData2() async {
    var date1 = datechoose.toString();
    var date2 = datechoose2.toString();
    try {
      var rqt = "http://localhost:8081/etudiant/postResrvation.php";
      await http.post(Uri.parse(rqt), body: {
        // "nomClient": txtName.text,
        // "typechambre": valeur,
        // "delaitresrvation": txtDelait.text,
        // "prixreservation": txtPrix.text,

        "numerochambre": type,
        "typechambre": numero,
        "datedebut": date1,
        "datefin": date1,
      });
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
        title: Text("F A I T E S  LA  R E S E R V A T I O N"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Column(children: [
              Text(
                "Categorie de chambre",
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 17,
                    color: Colors.grey[700]),
              ),
              SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90.0, vertical: 5.0),
                child: DropdownButton<String>(
                  value: dropdownValue2,
                  underline: Container(
                    height: 2,
                    color: Colors.grey[400],
                  ),
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownValue2 = newValue2!;
                      this.type = dropdownValue2;
                    });
                  },
                  items: _listes2.map<DropdownMenuItem<String>>((var value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    );
                  }).toList(),
                  isExpanded: false,
                  hint: Text("Choisissez le type de l'appartement"),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90.0, vertical: 5.0),
                child: DropdownButton<String>(
                  // dropdownColor: Colors.grey,
                  value: dropdownValue3,
                  underline: Container(
                    height: 2,
                    color: Colors.grey[400],
                  ),
                  onChanged: (String? newValue3) {
                    setState(() {
                      dropdownValue3 = newValue3!;
                      this.numero = dropdownValue3;
                      print(valeur);
                    });
                  },
                  items: _listes3.map<DropdownMenuItem<String>>((var value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    );
                  }).toList(),
                  isExpanded: false,
                  hint: Text(" Numero de chambre"),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            Divider(thickness: 0.5, color: Colors.grey[400])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Delait de reservation",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w100,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(datechoose == null
                      ? "Date de debut"
                      : DateFormat("yyyy-MM-dd").format(datechoose!)),
                  TextButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime.now())
                            .then((valeur) {
                          if (valeur == null) {
                            return;
                          }

                          setState(() => {datechoose = valeur});
                          print(datechoose);
                        });
                      },
                      child: const Text("choose")),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(datechoose2 == null
                      ? "Date de fin"
                      : DateFormat("yyyy-MM-dd").format(datechoose2!)),
                  TextButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime.now())
                            .then((valeur) {
                          if (valeur == null) {
                            return;
                          }

                          setState(() => {datechoose2 = valeur});
                          print(datechoose2);
                        });
                      },
                      child: const Text("choose")),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 70.0, vertical: 15.0),
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      saveData2();
                    },
                    mouseCursor: MouseCursor.defer,
                    color: Colors.blueAccent,
                    child: Text(
                      "Enregistré",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w100,
                          color: Colors.white),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 140.0, vertical: 20.0),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
