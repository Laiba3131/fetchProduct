import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DateTime date = DateFormat('yyyy-MM-dd').parse('2024-02-02');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numerical Axis Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Transform.scale(
                scale: 2,
                child: Transform.rotate(
                  angle: -0.2,
                  child: Text('dnfkjsd'),
                ),
              ),
              Container(
                height: 300,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ColumnSeries<ChartData, Widget>>[
                    ColumnSeries<ChartData, Widget>(
                      spacing: 0.1,
                      dataSource: <ChartData>[
                        ChartData(
                            Transform.scale(
                              scale: 2,
                              child: Transform.rotate(
                                angle: -0.2,
                                child: Text(
                                  DateFormat('MMMM dd, yyyy').format(
                                      DateFormat('yyyy-MM-dd')
                                          .parse('2024-02-01')),
                                ),
                              ),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-02')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-03')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-04')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-05')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-06')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-07')),
                            ),
                            360),
                      ],
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true, textStyle: TextStyle(fontSize: 10)),
                    ),
                    ColumnSeries<ChartData, Widget>(
                      spacing: 0.1,
                      dataSource: <ChartData>[
                        ChartData(
                            Transform.scale(
                              scale: 2,
                              child: Transform.rotate(
                                angle: -0.2,
                                child: Text(
                                  DateFormat('MMMM dd, yyyy').format(
                                      DateFormat('yyyy-MM-dd')
                                          .parse('2024-02-02')),
                                ),
                              ),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-02')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-02')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-02')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-02')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-02')),
                            ),
                            360),
                        ChartData(
                            Text(
                              DateFormat('MMMM dd, yyyy').format(
                                  DateFormat('yyyy-MM-dd').parse('2024-02-02')),
                            ),
                            360),
                      ],
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true, textStyle: TextStyle(fontSize: 10)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _transformDate(DateTime date) {
    // Implement your transformation logic here
    // For example, you can add some random characters to the date string
    return DateFormat('MMMM dd, yyyy').format(date);
  }
}

class ChartData {
  final Widget x;
  final double y;

  ChartData(this.x, this.y);
}
