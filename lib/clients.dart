import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:project_flut/Dashboard.dart';
import 'package:project_flut/reservation.dart';

String? stringResponse;

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
            ),

            // Padding(
            //   padding: const EdgeInsets.all(65.5),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         labelText: "Search",
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(10)))),
            //   ),
            // ),
          ],
        ),
        centerTitle: true,
        title: Text("Liste des clients"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Reservation()));
            },
            icon: Icon(Icons.add),
            tooltip: "add",
          ),
        ],
        // title: Text("Liste des clients"),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 0.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100.5, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 430,
                child: ListView.builder(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 50),
                    itemCount: listdist.length,
                    itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' Id :  ${listdist[index]['idClient']}',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    ' Nom :  ${listdist[index]['nomClient']}',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  Text(
                                    ' Numero :  ${listdist[index]['telephoneClient']}',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   width: 180,
                              // ),
                              IconButton(
                                onPressed: () {
                                  ShowData(
                                      int.parse(listdist[index]['idClient']));
                                },
                                icon: Icon(
                                  Icons.info,
                                  color: Colors.grey[700],
                                  size: 23,
                                ),
                                padding: EdgeInsets.only(right: 25.0),
                              )

                              // IconButton(
                              //     onPressed: () {
                              //       confirmDeleteAbonne(int.parse(
                              //           listdist[index]['idClient']));
                              //     },
                              //     icon: Icon(Icons.delete)),
                              // IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.update)),
                            ],
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void initState() {
    getData();
    super.initState();
  }

  List list = [];

  List listdist = [];

  Future<void> getData() async {
    final url = 'http://localhost:8081/etudiant/clients.php';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);

    setState(() {
      listdist = json.decode(response.body) as List;
      print(listdist);
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json[''] as List;
    }
  }

  // fonction pour supprimer un client

  Future<void> deleteAbonne(int idClient) async {
    try {
      var url = Uri.parse(
          "http://localhost:8081/etudiant/deleteClients.php?idClient=$idClient");
      var response = await http.delete(url);

      if (response.statusCode == 200) {
        setState(() {
          // Appel de  getData() dans setState pour forcer la mise à jour de l'interface utilisateur
          getData();
        });
        print("Client supprimé avec succès.");
      } else {
        print("Échec de la suppression du Client: ${response.statusCode}");
      }
    } catch (ex) {
      print("Erreur lors de la suppression du Client : $ex");
    }
  }

// confirmation de message de supression du client
  // Future<void> confirmDeleteAbonne(int idClient) async {
  //   // Convertir l'ID en int si ce n'est pas déjà le cas
  //   idClient = int.parse(idClient.toString());

  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Confirmation'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('Voulez-vous vraiment supprimer ce client ?'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Annuler'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: Text('Supprimer'),
  //             onPressed: () {
  //               deleteAbonne(idClient);
  //               getData();
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // List listInfo = [];

  // Future<void> GetInfoReservation(int idClient) async {
  //   try {
  //     var url = Uri.parse("http://localhost:8081/etudiant/innerJoin.php");
  //     final response = await http.get(url);
  //     print(response.statusCode);
  //     print(response.body);

  //     setState(() {
  //       listInfo = json.decode(response.body) as List;
  //       print(listInfo);
  //     });

  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body) as Map;
  //       final result = json[''] as List;
  //     }
  //   } catch (ex) {
  //     print("Erreur lors de l'affichage des info du Client : $ex");
  //   }
  // }

  Future<void> ShowData(int idClient) async {
    // Convertir l'ID en int si ce n'est pas déjà le cas
    idClient = int.parse(idClient.toString());

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var listh = listdist;
        return AlertDialog(
          title: Text('Information sur le client'),
          content: SingleChildScrollView(
            child: Builder(builder: (context) {
              return ListBody(
                children: <Widget>[
                  Text("$idClient"),
                ],
              );
            }),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Supprimer'),
              onPressed: () {
                // deleteAbonne(idClient);
                getData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
