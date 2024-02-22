// To parse this JSON data, do
//
//     final clients = clientsFromJson(jsonString);

import 'dart:convert';

Clients clientsFromJson(String str) => Clients.fromJson(json.decode(str));

String clientsToJson(Clients data) => json.encode(data.toJson());

class Clients {
  int idCategorie;
  String designCategorie;

  Clients({
    required this.idCategorie,
    required this.designCategorie,
  });

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
        idCategorie: json['idCategorie'],
        designCategorie: json['designCategorie'],
      );

  Map<String, dynamic> toJson() => {
        "idCategorie": idCategorie,
        "designCategorie": designCategorie,
      };
}
