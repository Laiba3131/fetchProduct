import 'package:flutter/material.dart';
import 'package:animated_pie_chart/animated_pie_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Animated Pie Chart'),
          ),
          body: Card(
            child: Center(
              child: AnimatedPieChart(
                stokeWidth: 8.0,
                padding: 3.0,
                animatedSpeed: 500,
                pieRadius: 70.0,
                colorsList: [
                  Colors.brown,
                  Colors.purple,
                  Colors.red,
                  Colors.yellow,
                  Colors.green,
                  Colors.blue,
                ],
                pieData: [
                  for (int i = 0; i < pieChartList.length; i++)
                    MdPieChart(
                        value: pieChartList[i].value,
                        name: pieChartList[i].name)
                ],
              ),
            ),
          ),
        ));
  }

  List<MdPieChart> pieChartList = [
    MdPieChart(value: 10, name: 'Apple'),
    MdPieChart(value: 5, name: 'Peach'),
    MdPieChart(value: 15, name: 'Mango'),
    MdPieChart(value: 20, name: 'Banana'),
    MdPieChart(value: 2, name: 'Peach'),
    MdPieChart(value: 8, name: 'Guava'),
    MdPieChart(value: 12, name: 'Lemon'),
    MdPieChart(value: 14, name: 'pineApple'),
    MdPieChart(value: 6, name: 'kiwi'),
    MdPieChart(value: 8, name: 'pear'),
  ];
}
