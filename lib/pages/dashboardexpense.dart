import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardExpense extends StatefulWidget {
  const DashboardExpense({super.key});

  @override
  State<DashboardExpense> createState() => _DashboardExpenseState();
}

class _DashboardExpenseState extends State<DashboardExpense> {
  //late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  List<_ChartData> data = [];
  late SelectionBehavior _selectionBehavior;

  Future<String> getJsonFromAssets() async {
    return await rootBundle.loadString('assets/expense.json');
  }

  Future loadChartData() async {
    final String jsonString = await getJsonFromAssets();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      data.add(_ChartData.fromJson(i));
    }
  }

  void initState() {
    loadChartData();
    _tooltip = TooltipBehavior(enable: true);
    _selectionBehavior = SelectionBehavior(
        enable: true,
        selectedColor: Color.fromARGB(255, 16, 38, 240),
        unselectedColor: Color.fromARGB(255, 248, 16, 97));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[Colors.pink, Colors.purpleAccent];

    final List<double> stops = <double>[0.2, 0.9];

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Scaffold(
        appBar: AppBar(
          title: const Text('รายการจ่ายของบ้านนาอุดม'),
        ),
        body: FutureBuilder(
            future: getJsonFromAssets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis:
                        NumericAxis(minimum: 0, maximum: 1000, interval: 10),
                    tooltipBehavior: _tooltip,
                    series: <ChartSeries<_ChartData, String>>[
                      ColumnSeries<_ChartData, String>(
                          dataSource: data,
                          selectionBehavior: _selectionBehavior,
                          xValueMapper: (_ChartData amount, _) => amount.Title,
                          yValueMapper: (_ChartData amount, _) => amount.amount,
                          name: 'บาท',
                          gradient: gradientColors,
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              // Positioning the data label
                              labelPosition: ChartDataLabelPosition.outside,
                              // Renders background rectangle and fills it with series color
                              useSeriesColor: true))
                    ]);
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}

class _ChartData {
  _ChartData(this.Title, this.amount);

  final String Title;
  final double amount;

  factory _ChartData.fromJson(Map<String, dynamic> parsedJson) {
    return _ChartData(
      parsedJson['Title'].toString(),
      parsedJson['amount'],
    );
  }
}
