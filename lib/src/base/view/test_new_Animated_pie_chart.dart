import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pie Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PieChartPage(),
    );
  }
}

class PieChartPage extends StatefulWidget {
  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  late bool toggleVisibility;
  late bool enableFloatingLegend;

  List<_ChartData> chartData = [
    _ChartData('Category 1', 25),
    _ChartData('Category 2', 35),
    _ChartData('Category 3', 20),
    _ChartData('Category 4', 10),
    _ChartData('Category 5', 10),
  ];
  List<String> listData = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfCircularChart(
          legend: Legend(isVisible: true, position: LegendPosition.bottom),
          title: ChartTitle(text: 'Expenses by category'),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: _getLegendOptionsSeries(),
        ),
      ),
    );
  }
}

List<PieSeries<_ChartData, String>> _getLegendOptionsSeries() {
  return <PieSeries<_ChartData, String>>[
    PieSeries<_ChartData, String>(
        dataSource: <_ChartData>[
          _ChartData('Tution Fees', 21),
          _ChartData('Entertainment', 21),
          _ChartData('Private Gifts', 8),
          _ChartData('Local Revenue', 21),
          _ChartData('Federal Revenue', 16),
          _ChartData('Others', 8)
        ],
        xValueMapper: (_ChartData data, _) => data.category as String,
        yValueMapper: (_ChartData data, _) => data.value,
        startAngle: 90,
        endAngle: 90,
        dataLabelSettings: const DataLabelSettings(isVisible: true)),
  ];
}

class _ChartData {
  _ChartData(this.category, this.value);

  final String category;
  final double value;
}
