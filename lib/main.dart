// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FirstProject());
  }
}

class FirstProject extends StatefulWidget {
  const FirstProject({super.key});

  @override
  State<FirstProject> createState() => _FirstProjectState();
}

class _FirstProjectState extends State<FirstProject> {
  String myName = "";
  final myController = TextEditingController();

  void myfunc() {
      setState(() {
        myName = myController.text;
      });
  }


  @override
  void initState() {
  super.initState();

  // Start listening to changes.
  myController.addListener(myfunc);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Handle changes to a text field",
          style: TextStyle(fontSize: 22),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(hintText: "Enter Your Name"),
            ),
          ),

          SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              myfunc();
            },

            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            ),
            child: Text("Click here", style: TextStyle(fontSize: 22)),
          ),

          SizedBox(height: 40),
          Text("My Name is :  $myName    ", style: TextStyle(fontSize: 27)),
        ],
      ),
    );
  }
}
