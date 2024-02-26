import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_flut/component/categorie.dart';

class Identite_client extends StatefulWidget {
  const Identite_client({Key? key}) : super(key: key);

  @override
  State<Identite_client> createState() => _Identite_clientState();
}

class _Identite_clientState extends State<Identite_client> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAdresse = TextEditingController();
  TextEditingController txtTelephone = TextEditingController();

  Future<void> saveData1() async {
    try {
      var url = "http://localhost:8081/etudiant/post.php";

      var response = await http
          .post(Uri.http("localhost:8081", "etudiant/post.php"), body: {
        "nomClient": txtName.text,
        "adresseClient": txtAdresse.text,
        "telephoneClient": txtTelephone.text
      });
      debugPrint(response.toString());
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 5.0),
              child: TextField(
                controller: txtName,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Nom du client",
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 5.0),
              child: TextField(
                controller: txtAdresse,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Adresse",
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 5.0),
              child: TextField(
                controller: txtTelephone,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Numéro de télephone",
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  saveData1();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Categorie_client()));
                },
                color: Colors.blueAccent,
                child: Text(
                  "Suivant",
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 90.0),
          //   child: RaisedButton(
          //     onPressed: () {
          //       saveData1();
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => Categorie_client()));
          //     },
          //     color: Colors.blueAccent,
          //     child: Text(
          //       "Envoyer",
          //       style: TextStyle(
          //           fontSize: 17,
          //           fontWeight: FontWeight.w100,
          //           color: Colors.white),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
