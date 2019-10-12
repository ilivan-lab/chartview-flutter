
import '../models/ChartDataSet.dart';
import 'package:flutter/material.dart';

import 'ChartViewState.dart';

///
/// ChartView
///
/// authors: Ilya Litosh
///
class ChartView extends StatefulWidget {

  static const Color DEFAULT_GRID_START_COLOR = Color(0xFF30CFD0);
  static const Color DEFAULT_GRID_END_COLOR = Color(0xFF330867);
  static const Color DEFAULT_GRID_LINE_COLOR = Color(0x0D000000);

  static const Color DEFAULT_CHART_LINE_START_COLOR = Color(0xA530C6D4);
  static const Color DEFAULT_CHART_LINE_END_COLOR = Color(0xA55566B0);

  ChartView({
    ChartDataSet chartDataSet,
    Color labelsTextColor = Colors.black,
    double labelsTextSize = 13,
    Color gridLineColor = DEFAULT_GRID_LINE_COLOR,
    double gridLineWidth = 1.3,
    double gridSize = 1.5,
    Color gridStartColor = DEFAULT_GRID_START_COLOR,
    Color gridEndColor = DEFAULT_GRID_END_COLOR,
    double flexure = 0.6,
    Color chartLineStartColor = DEFAULT_CHART_LINE_START_COLOR,
    Color chartLineEndColor = DEFAULT_CHART_LINE_END_COLOR,
    bool isPreview = false
  }) {
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
  ChartDataSet get chartDataSet => _chartDataSet;

  void set chartDataSet(ChartDataSet chartDataSet) {
    this._chartDataSet = chartDataSet;
  }

  Color _labelsTextColor;
  Color get labelsTextColor => _labelsTextColor;

  double _labelsTextSize;
  double get labelsTextSize => _labelsTextSize;

  Color _gridLineColor;
  Color get gridLineColor => _gridLineColor;

  double _gridLineWidth;
  double get gridLineWidth => _gridLineWidth;

  double _gridSize;
  double get gridSize => _gridSize;

  Color _gridStartColor;
  Color get gridStartColor => _gridStartColor;

  Color _gridEndColor;
  Color get gridEndColor => _gridEndColor;

  Color _chartLineStartColor;
  Color get chartLineStartColor => _chartLineStartColor;

  Color _chartLineEndColor;
  Color get chartLineEndColor => _chartLineEndColor;

  double _flexure;
  double get flexure => _flexure;

  @override
  State<StatefulWidget> createState() {
    if (_chartDataSet == null) {
      throw Exception("ChartDataSet is NULL");
    }
    return ChartViewState(
        _chartDataSet,
        _labelsTextColor, _labelsTextSize,
        _gridLineColor, _gridLineWidth,
        _gridSize,
        _gridStartColor, _gridEndColor,
        _flexure,
        _chartLineStartColor, _chartLineEndColor,
        _isPreview);
  }

}