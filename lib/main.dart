import 'dart:convert';

import 'package:flutter_echarts/flutter_echarts.dart';

import 'package:flutter/material.dart';

final List<double> data = [0.5, 0.8, 0.6, 0.8, 0.7];
final List<String> parameters = [
  '재물운',
  '사업운',
  '애정운',
  '시험운',
  '문제해결',
];

void main() {
  runApp(const MaterialApp(
    home: RadarChartWidget(),
  ));
}

// // echart
class RadarChartWidget extends StatelessWidget {
  const RadarChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chartOption = {
      'radar': {
        'indicator': generateIndicators(),
      },
      'series': [
        {
          'type': 'radar',
          'data': [
            {
              'value': data,
            },
          ],
        },
      ],
    };

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Radar Chart'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            // child: Echarts(option: chartOption.toString()),
            child: Echarts(option: jsonEncode(chartOption)),
          ),
        ],
      ),
    );
  }

  String generateIndicators() {
    String indicators = '';
    for (String parameter in parameters) {
      indicators += '{ text: "$parameter" },';
    }
    return '[${indicators.substring(0, indicators.length - 1)}]';
  }
}
