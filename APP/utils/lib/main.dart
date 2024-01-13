import 'package:flutter/material.dart';
import 'package:utils/getIp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<String>(
            future: ipAdd(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Erreur lors de la récupération de l'adresse IP");
              } else {
                String ipAddress = snapshot.data ?? "Adresse IP non disponible";
                return Text("L'adresse IP Flask récupérer depuis le serveur est $ipAddress");
              }
            },
          ),
        ),
      ),
    );
  }
}