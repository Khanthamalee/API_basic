import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Importdata extends StatefulWidget {
  //const Importdata({super.key});

  @override
  State<Importdata> createState() => _ImportdataState();
}

class _ImportdataState extends State<Importdata> {
  TextEditingController dateController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController expenseController = TextEditingController();
  TextEditingController result = TextEditingController();

  final List<String> itemsexpense = [
    'ยาสระผม',
    'สบู่',
    'แก้วน้ำ',
    'ผงซักฟอก',
    'ผัก',
    'น้ำมัน',
    'น้ำตาล',
    'เนื้อหมู',
  ];

  final List<String> itemsincome = [
    'ขายเป็ดเนื้อ',
    'ขายปลานิล',
    'ขายกล้วย',
    'ขายหอย',
    'ขายผักสลัด',
    'ขายไก่เนื้อ',
  ];

  String? incomeselectedValue;
  final TextEditingController incometextEditingController =
      TextEditingController();

  String? expenseselectedValue;
  final TextEditingController expensetextEditingController =
      TextEditingController();

  @override
  void dispose() {
    incometextEditingController.dispose();
    expensetextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result.text =
        "วันที่ 0000-00-00 \n รายรับ x บาท \n รายจ่าย x บาท \n คงเหลือ x บาท";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: <Widget>[
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
                //ส่วนของหัวข้อ
                Text(
                  "ส่วนบันทึกรายรับรายจ่าย",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //วันที่
                SizedBox(
                    width: 210,
                    child: Column(children: [
                      TextField(
                          controller:
                              dateController, //editing controller of this TextField
                          decoration: const InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText: "วันที่ : ",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 28, 5, 206),
                                fontSize: 16.0),
                            //label text of field
                          ),
                          readOnly: true, // when true user cannot edit text
                          onTap: () async {
                            //when click we have to show the datepicker
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              print(
                                  pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd')
                                  .format(
                                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(
                                  formattedDate); //formatted date output using intl package =>  2022-07-04
                              //You can format date as per your need

                              setState(() {
                                dateController.text =
                                    formattedDate; //set foratted date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          })
                    ])),
                SizedBox(
                  height: 15,
                ),
                //รายการจ่าย
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //ดรอปดาวน์ลิสในแถว
                    Container(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(
                            '   รายการซื้อ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          items: itemsexpense
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: expenseselectedValue,
                          onChanged: (value) {
                            setState(() {
                              expenseselectedValue = value as String;
                            });
                          },
                          buttonHeight: 50,
                          buttonWidth: 180,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Color.fromARGB(255, 233, 237, 235),
                          ),
                          buttonElevation: 2,
                          itemHeight: 50,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 250,
                          dropdownWidth: 180,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(255, 93, 253, 250),
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 10,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-20, 0),
                          searchController: expensetextEditingController,
                          searchInnerWidget: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              controller: expensetextEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'ค้นหา...',
                                hintStyle: const TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return (item.value
                                .toString()
                                .contains(searchValue));
                          },
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              expensetextEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                    Text('   '),
                    //กรอกราคา
                    SizedBox(
                        width: 80,
                        child: Column(children: [
                          TextField(
                              controller: expenseController,
                              decoration: InputDecoration(
                                labelText: "ราคา",
                                floatingLabelStyle:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 7, 0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 244, 171, 54),
                                      width: 5,
                                    )),
                              )),
                        ])),
                    Text(
                      '  บาท',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    //ปุ่ม
                    // FloatingActionButton.extended(
                    //   onPressed: () {
                    //     print(expenseController.text);
                    //     // Add your onPressed code here!
                    //   },
                    //   label: Text('บันทึกรายการซื้อ'),
                    //   backgroundColor: Color.fromRGBO(4, 137, 185, 0.855),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //รายการรับ
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  //ดรอปดาวน์ลิสในแถว
                  Container(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          '    รายการรับ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        items: itemsincome
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: incomeselectedValue,
                        onChanged: (value) {
                          setState(() {
                            incomeselectedValue = value as String;
                          });
                        },
                        buttonHeight: 50,
                        buttonWidth: 180,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Color.fromARGB(255, 233, 237, 235),
                        ),
                        buttonElevation: 2,
                        itemHeight: 50,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 250,
                        dropdownWidth: 180,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color.fromARGB(255, 93, 253, 250),
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 10,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                        searchController: incometextEditingController,
                        searchInnerWidget: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            controller: incometextEditingController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'ค้นหา...',
                              hintStyle: const TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return (item.value.toString().contains(searchValue));
                        },
                        //This to clear the search value when you close the menu
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            incometextEditingController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                  Text('   '),
                  //กรอกราคา
                  SizedBox(
                      width: 80,
                      child: Column(children: [
                        TextField(
                            controller: incomeController,
                            decoration: InputDecoration(
                              labelText: "ราคา",
                              floatingLabelStyle:
                                  TextStyle(color: Colors.blue, fontSize: 14),
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 5, 0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 244, 171, 54),
                                    width: 4,
                                  )),
                            )),
                      ])),
                  Text('  บาท',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ]),
                SizedBox(
                  height: 15,
                ),
                //ปุ่มจำนวนเงินคงเหลือ
                FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      var cal = double.parse(incomeController.text) -
                          double.parse(expenseController.text);
                      result.text =
                          "วันที่: ${dateController.text}\n${incomeselectedValue} ${incomeController.text} บาท \n${expenseselectedValue} ${expenseController.text} บาท \nคงเหลือ $cal บาท";
                      print(incomeselectedValue);
                      print(expenseselectedValue);
                    });
                    // Add your onPressed code here!
                  },
                  label: Text('คำนวณเงินคงเหลือ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                  backgroundColor: Colors.pink,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  result.text,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    ]));
  }
}
