import 'package:calculateapp/pages/contact.dart';
import 'package:calculateapp/pages/dashboard.dart';
import 'package:calculateapp/pages/home.dart';
import 'package:calculateapp/pages/importdata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  //const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [
    Homepage(),
    Importdata(),
    Dashboard(),
    Contact(),
  ]; //เก็บ stf ได้หลายอันเริ่มนับจาก 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "บ้านนาอุดม",
          style: const TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 248, 249, 250),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //สำหรับภาษา dart ชื่อ list[0] คือ class HomePage ใน home.dart
      body:
          tabs[_currentIndex], //ส่วนโชว์ของ Widget ในหน้า home.dart เป็นหน้าแรก
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: _currentIndex => คำสั่งให้หน้าแรกคือ Home Icon.home จะเป็นสิ amber
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: (Icon(Icons.home)), label: "หน้าแรก"),
          BottomNavigationBarItem(icon: (Icon(Icons.save)), label: "บันทึก"),
          BottomNavigationBarItem(
              icon: (Icon(Icons.dashboard)), label: "ข้อมูล"),
          BottomNavigationBarItem(
              icon: (Icon(Icons.contacts)), label: "ติดต่อ"),
        ],
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromARGB(255, 1, 1, 154),
        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
