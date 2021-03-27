import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rabbitx_converter/rabbitx_converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text(RabbitxConverter.uni2zg("ယူနီကုဒ်")),
            ),
            Center(
              child: Text(RabbitxConverter.zg2uni("ေဇာ္ဂ်ီ")),
            ),
          ],
        ),
      ),
    );
  }
}
