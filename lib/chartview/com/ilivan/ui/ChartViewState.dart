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

  ChartViewState(
    ChartDataSet chartDataSet,
    Color labelsTextColor,
    double labelsTextSize,
    Color gridLineColor,
    double gridLineWidth,
    double gridSize,
    Color gridStartColor,
    Color gridEndColor,
    double flexure,
    Color chartLineStartColor,
    Color chartLineEndColor,
    bool isPreview
  ) {
    this._chartDataSet = chartDataSet;

    this._labelsTextColor = labelsTextColor;
    this._labelsTextSize = labelsTextSize;
    this._gridLineColor = gridLineColor;
    this._gridLineWidth = gridLineWidth;
    this._gridSize = gridSize;
    this._gridStartColor = gridStartColor;
    this._gridEndColor = gridEndColor;
    this._flexure = flexure;
    this._chartLineStartColor = chartLineStartColor;
    this._chartLineEndColor = chartLineEndColor;

    this._isPreview = isPreview;
  }

  bool _isPreview;

  ChartDataSet _chartDataSet;

  Color _labelsTextColor;

  double _labelsTextSize;

  Color _gridLineColor;

  double _gridLineWidth;

  double _gridSize;

  Color _gridStartColor;

  Color _gridEndColor;

  Color _chartLineStartColor;

  Color _chartLineEndColor;

  double _flexure;

  ChartDataSet _createChartDataSet() {
    return ChartDataSet.builder()
        .add(0, 6.5)
        .add(1, 12.0)
        .add(2, 10.0)
        .add(3, 11.2)
        .add(4, 9.2)
        .add(5, 8.7)
        .add(6, 10.8)
        .add(7, 13.5)
        .build();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChartViewPainter(
        _isPreview ? _createChartDataSet() : _chartDataSet,
        _labelsTextColor, _labelsTextSize,
        _gridLineColor, _gridLineWidth,
        _gridSize,
        _gridStartColor, _gridEndColor,
        _flexure,
        _chartLineStartColor, _chartLineEndColor
      ),
      child: Container(
        height: 300,
      ),
    );
  }

}