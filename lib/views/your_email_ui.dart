import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourEmailUI extends StatefulWidget {
  const YourEmailUI({Key? key}) : super(key: key);

  @override
  State<YourEmailUI> createState() => _YourEmailUIState();
}

class _YourEmailUIState extends State<YourEmailUI> {
  TextEditingController emailctrl = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        // ignore: prefer_const_constructors
        title: Text(
          'Add/Edit Email',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              'ป้อนอีเมลล์',
              style: GoogleFonts.charm(
                fontSize: 35.0,
                color: Colors.green[800],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: TextField(
                controller: emailctrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนอีเมลล์',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (emailctrl.text.trim().length == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                        ),
                        content: Text(
                          'ป้อนชื่อของคุณด้วย',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'ตกลง',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  //บันทึกที่ป้อนลงไปเก็บไว้ที่ sharePreference และกลับไป home
                }
              },
              child: Text(
                'บันทึก',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.7,
                  50.0,
                ),
                primary: Colors.green[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
