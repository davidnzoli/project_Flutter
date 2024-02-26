import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.white, size: 30.0),
                Image.asset("./../assets/profile.png", width: 30.0)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Dashboard options",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 18),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  SizedBox(
                    width: 160.0,
                    height: 140.0,
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                "./../assets/parametres.png",
                                width: 45,
                              ),
                              SizedBox(height: 10.0),
                              Text("Paramètres",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                              SizedBox(height: 5.0),
                              Text(
                                "Modifier paramètres",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160.0,
                    height: 140.0,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                "./../assets/reservation.png",
                                width: 45,
                              ),
                              SizedBox(height: 10.0),
                              Text("Reservation",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                              SizedBox(height: 5.0),
                              Text(
                                "chambre & Categorie",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160.0,
                    height: 140.0,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                "./../assets/reserve.png",
                                width: 45,
                              ),
                              SizedBox(height: 10.0),
                              Text("Info chambre",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                              SizedBox(height: 5.0),
                              Text(
                                "chambres occupees",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160.0,
                    height: 140.0,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                "./../assets/invite.png",
                                width: 45,
                              ),
                              SizedBox(height: 10.0),
                              Text("Nos clients",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                              SizedBox(height: 5.0),
                              Text(
                                "satisfaction des clients",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160.0,
                    height: 140.0,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                "./../assets/appartements.png",
                                width: 45,
                              ),
                              SizedBox(height: 10.0),

                              Text("Information reservation",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                              SizedBox(height: 5.0),
                              // Text(
                              //   "",
                              //   style: TextStyle(
                              //       color: Colors.orangeAccent,
                              //       fontWeight: FontWeight.w100),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}


// import 'dart:convert';
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class client extends StatefulWidget {
//   const client({Key? key}) : super(key: key);

//   @override
//   State<client> createState() => _clientState();
// }

// class _clientState extends State<client> {
//   List list = [];

//   List listClients = [];
//   Future<void> getData() async {
//     final url = 'http://localhost:8081/etudiant/clients.php';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);

//     setState(() {
//       listClients = json.decode(response.body) as List;
//       print(listClients);
//     });

//     // if (response.statusCode == 200) {
//     //   final json = jsonDecode(response.body) as Map;
//     //   final result = json['tbdistributions'] as List;
//     //   setState(() {
//     //     list = result;
//     //   });
//     // } else {}
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Distribution"),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Nos clients actuels',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 Divider(
//                   height: 3,
//                 ),
//                 SingleChildScrollView(
//                   child: Container(
//                     height: 500,
//                     child: ListView.builder(
//                         itemCount: listClients.length,
//                         itemBuilder: (context, index) => Container(
//                               margin: EdgeInsets.only(
//                                 bottom: 10,
//                               ),
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(color: Colors.white),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     ' ID :  ${listClients[index]['idClient']}',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     ' NAME :  ${listClients[index]['nomClient']}',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   Text(
//                                     ' TELEPHONE :  ${listClients[index]['telephoneClients']}',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 ],
//                               ),
//                             )),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }

//   void showSuccessMessage(String message) {
//     final snackBar = SnackBar(content: Text(message));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   void showErrorMessage(String message) {
//     final snackBar = SnackBar(
//       content: Text(
//         message,
//         style: TextStyle(color: Colors.white),
//       ),
//       backgroundColor: Colors.red,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   //API GET DATA

// }
