import 'package:flutter/material.dart';
import 'package:my_profile_app/views/home_ui.dart';
import 'package:my_profile_app/views/your_email_ui.dart';
import 'package:my_profile_app/views/your_name_ui.dart';
import 'package:my_profile_app/views/your_phone_ui.dart';

void main(List<String> args) {
  runApp(
    // ignore: prefer_const_constructors
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: YourNameUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}
