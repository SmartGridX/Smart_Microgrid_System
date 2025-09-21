import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Smart Microgrid System"), centerTitle: true),
      body: Center(child: Text("Hi, Welcome to the app :)")),
    );
  }
}
