import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_profile_app/views/your_about_ui.dart';
import 'package:my_profile_app/views/your_email_ui.dart';
import 'package:my_profile_app/views/your_name_ui.dart';
import 'package:my_profile_app/views/your_phone_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        // ignore: prefer_const_constructors
        title: Text(
          'My Profile',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.brown,
                      width: 5.0,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'asset/images/my_profile.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    size: MediaQuery.of(context).size.width * 0.008,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35.0,
                right: 35.0,
              ),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  label: Text(
                    'Your name',
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Your name',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YourNameUI(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35.0,
                right: 35.0,
              ),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  label: Text(
                    'Your phone :',
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Your phone',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YourPhoneUI(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35.0,
                right: 35.0,
              ),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  label: Text(
                    'Your email :',
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Your email',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YourEmailUI(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35.0,
                right: 35.0,
              ),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  label: Text(
                    'Your about :',
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Your about',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YourAboutUI(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
