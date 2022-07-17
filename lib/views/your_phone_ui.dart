import 'package:flutter/material.dart';

class YourPhoneUI extends StatefulWidget {
  const YourPhoneUI({Key? key}) : super(key: key);

  @override
  State<YourPhoneUI> createState() => _YourPhoneUIState();
}

class _YourPhoneUIState extends State<YourPhoneUI> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        // ignore: prefer_const_constructors
        title: Text(
          'Add/Edit Phone',
        ),
        centerTitle: true,
      ),
    );
  }
}
