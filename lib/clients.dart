import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String? stringResponse;

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  // Future<List<Clients>> getData() async {
  //   try {
  //     final response = await http
  //         .get(Uri.parse("http://localhost:8081/etudiant/categorie.php"));
  //     final body = json.decode(response.body) as List;

  //     print(body);
  //     if (response.statusCode == 200) {
  //       return body.map((e) {
  //         final map = e as Map<String, dynamic>;
  //         return Clients(
  //           idCategorie: map['idCategorie'],
  //           designCategorie: map['designCategorie'],
  //         );
  //       }).toList();
  //     }
  //   } on SocketException {
  //     throw Exception("error");
  //   }
  //   throw Exception("fetch error");
  // }

  Future apiCall() async {
    http.Response response;
    response =
        await http.get(Uri.parse("http://localhost:8081/etudiant/loginn.php"));
    if (response.statusCode == 200) {
      stringResponse = response.body;
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown button"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.blue),
          child: Center(
            child: Text(stringResponse.toString()),
          ),
        ),
      ),
    );
  }
}
