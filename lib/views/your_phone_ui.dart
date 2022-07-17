import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourPhoneUI extends StatefulWidget {
  const YourPhoneUI({Key? key}) : super(key: key);

  @override
  State<YourPhoneUI> createState() => _YourPhoneUIState();
}

class _YourPhoneUIState extends State<YourPhoneUI> {
  TextEditingController Phonectrl = TextEditingController(text: '');
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
              'ป้อนเบอร์โทรศัพท์',
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
                controller: Phonectrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนเบอร์โทรของคุณ',
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
                if (Phonectrl.text.trim().length == 0) {
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
