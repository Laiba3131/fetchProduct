import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column Chart'),
        ),
        body: Center(
          child: Container(
            height: 300,
            child: SfCartesianChart(
              title: ChartTitle(text: 'Population growth of various countries'),
              borderWidth: 0.0,
              primaryXAxis: const CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              series: <CartesianSeries>[
                ColumnSeries<ChartData, String>(
                  dataSource: <ChartData>[
                    ChartData('A', 10),
                    ChartData('B', 20),
                    ChartData('C', 30),
                    ChartData('D', 40),
                  ],
                  xValueMapper: (ChartData data, _) => data.category,
                  yValueMapper: (ChartData data, _) => data.value,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true, textStyle: TextStyle(fontSize: 10)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}
