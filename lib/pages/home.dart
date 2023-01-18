import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:calculateapp/pages/dashboardexpense.dart';
import 'package:calculateapp/pages/dashboardincome.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  var data = json.decode(snapshot.data.toString());
                  final topic = [
                    "สินค้าที่ขายได้ที่สุด 3 อันดับแรก",
                    "สินค้าที่ซื้อมากที่สุด 3 อันดับแรก"
                  ];
                  final functioninput = [DashboardIncome(), DashboardExpense()];
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Mybox(
                              topic[index],
                              data[index]["name1"],
                              data[index]["image1"],
                              data[index]["name2"],
                              data[index]["image2"],
                              data[index]["name3"],
                              data[index]["image3"],
                              functioninput[index]),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    },
                    itemCount: data.length,
                  );
                },
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data.json'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Mybox(
    String topic,
    String name1,
    String image1,
    String name2,
    String image2,
    String name3,
    String image3,
    var functioninput,
  ) {
    return Container(
      //color: Colors.amber[200],
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
              'https://scontent.fnak2-1.fna.fbcdn.net/v/t1.15752-9/322590227_1314870939304495_6347159632462467318_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=ae9488&_nc_ohc=QgdJ7cf_yUMAX8NVwBg&_nc_ht=scontent.fnak2-1.fna&oh=03_AdRGzdJiCGi14vsdlmJqkujsPRxH4LfrkJ5oLppkdb0K8Q&oe=63EB6192https://scontent.fnak2-1.fna.fbcdn.net/v/t1.15752-9/322590227_1314870939304495_6347159632462467318_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=ae9488&_nc_ohc=QgdJ7cf_yUMAX8NVwBg&_nc_ht=scontent.fnak2-1.fna&oh=03_AdRGzdJiCGi14vsdlmJqkujsPRxH4LfrkJ5oLppkdb0K8Q&oe=63EB6192'),
          fit: BoxFit.cover,
          scale: 1,
          colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 0, 0, 0).withOpacity(0.4), BlendMode.dstATop),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(topic,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                )),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset(
                      image1,
                      width: 120,
                      height: 120,
                    ),
                    Text(name1,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset(
                      image2,
                      width: 120,
                      height: 120,
                    ),
                    Text(name2,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset(
                      image3,
                      width: 120,
                      height: 120,
                    ),
                    Text(name3,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
                onPressed: () {
                  print('Naxt to Dashboard');
                  // print(
                  //     'functioninput.runtimeType : ${functioninput.runtimeType}');
                  // print('functioninput : $functioninput');

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => functioninput));
                },
                child: Text('ข้อมูลเพิ่มเติม...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 5, 28, 62),
                      fontWeight: FontWeight.bold,
                    ))),
          )
        ],
      ),
    );
  }
}
