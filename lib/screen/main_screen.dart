// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller = TextEditingController();
  bool showText = false;
  @override
  Widget build(BuildContext context) {
    var bytes1 = utf8.encode(controller.text);
    var digest1 = sha256.convert(bytes1);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: Center(
          child: Card(
            child: Column(
              children: [
                TextField(
                  controller: controller,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      var bytes1 = utf8.encode(controller.text);
                      var digest1 = sha256.convert(bytes1);
                      showText = true;
                    });
                  },
                  child: const Text('Show Text'),
                ),
                Text(
                  (showText == true) ? '$digest1' : 'null',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hashing Process
}
