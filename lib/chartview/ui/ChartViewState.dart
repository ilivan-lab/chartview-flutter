import 'package:flutter/material.dart';
import '../models/ChartDataSet.dart';
import '../ui/ChartViewPainter.dart';

import 'ChartView.dart';

///
/// ChartViewState
///
/// authors: Ilya Litosh
///
class ChartViewState extends State<ChartView> {

  @override
  Widget build(BuildContext context) {
    ChartDataSet chartDataSet = ChartDataSet.build()
        .add(0, 6.5)
        .add(1, 12.0)
        .add(2, 10.0)
        .add(3, 11.2)
        .add(4, 9.2)
        .add(5, 8.7)
        .add(6, 10.8)
        .add(7, 13.5)
        .build();
    return CustomPaint(
      painter: ChartViewPainter(
        chartDataSet: chartDataSet,
      ),
      child: Container(
        height: 300,
      ),
    );
  }

}