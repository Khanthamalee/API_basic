import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          //ทำ background
          Container(
              //imagebackground
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/flo.jpg"),
                  fit: BoxFit.cover,
                  scale: 1,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                      BlendMode.dstATop),
                ),
              ),
              child: null),
          //ข้อความบนพื้นหลัง
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text("ส่วนทำช่องทางติดต่อกับแอดมิน"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
