import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map receiveData = {"timezone": "Egypt..."};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            receiveData["timezone"],
            style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10,),
            Text(
            receiveData["local_time"],
            style: TextStyle(fontSize: 15),
            ),
             SizedBox(height: 10,),
            Text(
            receiveData["day_of_week"],
            style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Response response = await get(
            Uri.parse(
              "https://timeapi.io/api/v1/timezone/zone?timeZone=Africa/Cairo",
            ),
          );

          setState(() {
            receiveData = jsonDecode(response.body);
          });
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
