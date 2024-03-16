import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 110, 207, 110),
        body: Container(
          child: const Center(
            child: Text('Hello App!!!'),
          ),
        ),
      ),
    ),
  );
}
