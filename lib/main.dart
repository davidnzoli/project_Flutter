import 'package:flutter/material.dart';
import 'package:project_flut/Dashboard.dart';
import 'package:project_flut/clients.dart';
import 'package:project_flut/reservation.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Reservation(),
  ));
}

class LoginAdminPage extends StatelessWidget {
  const LoginAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          // key: _formKey,
          children: [
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.lock,
              size: 80,
              color: Colors.blueAccent,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
            ),
            Text(
              "WELCOME TO Admin Login",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  labelText: "name or adress-Mail",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalide nom admin";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "passe word",
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
                validator: (valeur) {
                  if (valeur == null || valeur.isEmpty) {
                    return "invalide";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(content: Text("Envoie en cour...")));
                    // }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                  // mouseCursor: MouseCursor.defer,
                  // color: Colors.blueAccent,
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 140.0, vertical: 25.5),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
