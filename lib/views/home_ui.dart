import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_profile_app/views/your_about_ui.dart';
import 'package:my_profile_app/views/your_email_ui.dart';
import 'package:my_profile_app/views/your_name_ui.dart';
import 'package:my_profile_app/views/your_phone_ui.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //สร้าง contoler ของแต่ละ textfield
  TextEditingController yournameCtrl = TextEditingController(text: '');
  TextEditingController yourphoneCtrl = TextEditingController(text: '');
  TextEditingController youremailCtrl = TextEditingController(text: '');
  TextEditingController youraboutCtrl = TextEditingController(text: '');
//สร้าง object ที่ใช้เก็บรูปภาพ
  File? _image;

  get prefer => null;
//เอารูปจาก กล้อง
  getImageFromCameraAndSaveToSF() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    //กำหนดที่ให้แสดงผล
    if (pickImage != null) {
      setState(() {
        _image = File(pickImage.path);
      });
    }
    //บันทึกข้อมูลภาพวั้ยในเครื่อง
    Directory imageDir = await getApplicationDocumentsDirectory();
    String imagePath = imageDir.path;
    var imageName = basename(pickImage!.path);
    File localImage = await File(pickImage.path).copy('$imagePath/$imageName');
    //และ sharepreference
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourimage', localImage.path);
  }
// เอารูปจากคลังภาพ

  getImageFromGalloyAndSaveToSF() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      setState(() {
        _image = File(pickImage.path);
      });
    }
    Directory imageDir = await getApplicationDocumentsDirectory();
    String imagePath = imageDir.path;
    var imageName = basename(pickImage!.path);
    File localImage = await File(pickImage.path).copy('$imagePath/$imageName');
    //และ sharepreference
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourgallory', localImage.path);
  }

//จะทำการตรวจสอบว่ามีค่ามั้ย ถ้ามีจะเอามาวั้ยใน textfiel
  check_and_show_data() async {
    //เริ่มจากสร้าง object ของ sharepreferance
    SharedPreferences prefer = await SharedPreferences.getInstance();
    bool yournameKey = prefer.containsKey('yourname');
    bool yourphoneKey = prefer.containsKey('yourphone');
    bool youremailKey = prefer.containsKey('youremail');
    bool youraboutKey = prefer.containsKey('yourabout');
    bool yourimageKey = prefer.containsKey('yourimage');
    // if มีข้อมูลจะขึ้นโชเลยทันที
    if (yournameKey == true) {
      setState(() {
        yournameCtrl.text = prefer.getString('yourname')!;
      });
    }
    if (yourphoneKey == true) {
      setState(() {
        yourphoneCtrl.text = prefer.getString('yourphone')!;
      });
    }
    if (youremailKey == true) {
      setState(() {
        youremailCtrl.text = prefer.getString('youremail')!;
      });
    }
    if (youraboutKey == true) {
      setState(() {
        youraboutCtrl.text = prefer.getString('yourabout')!;
      });
    }
    if (yourimageKey == true) {
      setState(() {
        _image = File(prefer.getString('yourimage')!);
      });
    }
  }

  @override
  void initState() {
    // เมธอด Initstateนี้จะทำงานครั้งแรกทุกครั้งที่เปิดหน้าจอนี้ขึ้นมา

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null
                    ? Container(
                        height: MediaQuery.of(context).size.width * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.brown,
                            width: 5.0,
                          ),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(
                              'asset/images/my_profile.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.width * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.brown,
                            width: 5.0,
                          ),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: FileImage(
                              _image!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                IconButton(
                  onPressed: () {
                    getImageFromCameraAndSaveToSF();
                  },
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    size: MediaQuery.of(context).size.width * 0.10,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35.0,
                right: 35.0,
              ),
              child: TextField(
                controller: yournameCtrl,
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
                      ).then((value) {
                        check_and_show_data();
                      });
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
                controller: yourphoneCtrl,
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
                      ).then((value) {
                        check_and_show_data();
                      });
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
                controller: youremailCtrl,
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
                      ).then((value) {
                        check_and_show_data();
                      });
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
                controller: youraboutCtrl,
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
                      ).then((value) {
                        check_and_show_data();
                      });
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
