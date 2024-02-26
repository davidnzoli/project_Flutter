class Event {
  final int idClient;
  final String nomClient;
  final String adresseClient;
  final int telephoneClient;

  Event({
    required this.idClient,
    required this.nomClient,
    required this.adresseClient,
    required this.telephoneClient,
  });

  factory Event.fromData(dynamic data) {
    return Event(
      idClient: data['idClient'],
      nomClient: data['nomClient'],
      adresseClient: data['adresseClient'],
      telephoneClient: data['telephoneClient'],
    );
  }
}
