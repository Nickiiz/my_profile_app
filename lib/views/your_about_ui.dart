import 'package:flutter/material.dart';

class YourAboutUI extends StatefulWidget {
  const YourAboutUI({Key? key}) : super(key: key);

  @override
  State<YourAboutUI> createState() => _YourAboutUIState();
}

class _YourAboutUIState extends State<YourAboutUI> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        // ignore: prefer_const_constructors
        title: Text(
          'Add/Edit About',
        ),
        centerTitle: true,
      ),
    );
  }
}
