
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' as intl;
import '../models/ChartGrid.dart';
import '../models/ChartDataSet.dart';
import 'dart:ui' as dartUI;

///
/// ChartViewPainter
///
/// authors: Ilya Litosh
///
class ChartViewPainter extends CustomPainter {

  ChartViewPainter(
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

    _initialize();
  }

  Color _labelsTextColor;

  double _labelsTextSize;

  Color _gridLineColor;

  double _gridLineWidth;

  double _gridSize;

  Color _gridStartColor;

  Color _gridEndColor;

  Color _chartLineStartColor;

  Color _chartLineEndColor;

  ChartDataSet _chartDataSet = new ChartDataSet();

  int get pointsCount {
    if (_chartDataSet == null) {
      return 0;
    } else {
      return _chartDataSet.points.length;
    }
  }

  ///
  /// Returns margin of left side
  /// for Chart inside grid of chart
  ///
  ///
  double marginGridLeft() {
    return _chartGrid.marginLeft;
  }

  ///
  /// Returns margin of bottom side
  /// for Chart inside grid of chart
  ///
  ///
  double marginGridBottom() {
    return _chartGrid.marginBottom;
  }

  Paint _chartFigurePaint = new Paint();

  Paint _textPaint = new Paint();
  Paint _gridLinePaint = new Paint();
  Paint _gridPointPaint = new Paint();
  void _initialize() {
    _textPaint.color = _labelsTextColor;
    _textPaint.isAntiAlias = true;

    _chartFigurePaint.isAntiAlias = true;

    _gridLinePaint.strokeWidth = _gridLineWidth;
    _gridLinePaint.color = _gridLineColor;

    _measureLabelSize();
  }

  void _measureLabelSize() {
    TextPainter tp = TextPainter();
    tp.textDirection = TextDirection.ltr;
    tp.text = TextSpan(
        text: "00.0", style: TextStyle(fontSize: _labelsTextSize));
    tp.layout();
    _labelWidth = tp.width;
    _labelHeight = tp.height;
  }

  double _labelWidth;
  double _labelHeight;

  ChartGrid _chartGrid;
  void _initChartGrid(Size size) {
    print("${size.width}-${size.height}");
    double marginGridLeft = _labelWidth + _labelWidth / 3;
    double marginGridBottom = _labelHeight + _labelHeight / 2;
    _chartGrid = ChartGrid.build()
        .marginLeft(marginGridLeft)
        .marginBottom(marginGridBottom)
        .scaleDivisionX((size.width - marginGridLeft) / (pointsCount - 1))
        .scaleDivisionY(_labelHeight * 3.0)
        .width(size.width - marginGridLeft)
        .height(size.height - marginGridBottom)
        .build();
  }

  dartUI.Gradient _gridPointShader;
  dartUI.Gradient _chartFigureShader;
  void _initShaders(Size size) {
    _gridPointShader = dartUI.Gradient.linear(
        Offset(marginGridLeft(), 0),
        Offset(marginGridLeft(), size.height - marginGridBottom()),
        [_gridStartColor, _gridEndColor]);
    _chartFigureShader = dartUI.Gradient.linear(
        Offset(marginGridLeft(), 0),
        Offset(marginGridLeft(), size.height - marginGridBottom()),
        [_chartLineStartColor, _chartLineEndColor]);
    _gridPointPaint.shader = _gridPointShader;
    _chartFigurePaint.shader = _chartFigureShader;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _initChartGrid(size);
    _initShaders(size);

    _drawLabels(canvas, size);
    _drawGrid(canvas, size);
    _drawChart(canvas, size);
  }

  TextPainter _textPainter = TextPainter(textDirection: TextDirection.ltr);
  void _drawText(Canvas canvas, double x, double y, String text) {
    _textPainter.text = TextSpan(
        text: text, style: TextStyle(fontSize: _labelsTextSize, color: _labelsTextColor));
    _textPainter.layout();
    _textPainter.paint(canvas, Offset(x, y));

  }

  void _drawLabels(Canvas canvas, Size size) {
    _drawAxisX(canvas, size);
    _drawAxisY(canvas);
  }

  void _drawAxisX(Canvas canvas, Size size) {
    double scaleDivision = _chartGrid.scaleDivisionX;
    for (int i = 0; i < pointsCount - 1; i++) {
      String labelText = _chartDataSet.points[i].x.toInt().toString();
      _drawText(canvas, i * scaleDivision + marginGridLeft(), size.height, labelText);
    }
  }

  void _drawAxisY(Canvas canvas) {
    double chartGridHeight = _chartGrid.height;
    double maxValue = _chartDataSet.maxValue.y;
    double scaleDivision = _chartGrid.scaleDivisionY;

    for (double i = chartGridHeight; i > 0; i -= scaleDivision) {
      double axisYLabelValue = (i * maxValue / chartGridHeight - maxValue).abs();
      intl.NumberFormat nf = intl.NumberFormat("#.#");
      String formattedValue = nf.format(axisYLabelValue);
      _drawText(canvas, 0, i, formattedValue);//.replaceAll(".", ","));
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    for (double i = _chartGrid.height; i > 0; i -= _chartGrid.scaleDivisionY) {
      canvas.drawLine(Offset(marginGridLeft(), i), Offset(size.width, i), _gridLinePaint);
      for (double j = 0; j < pointsCount; j++) {
        double coorX = j * _chartGrid.scaleDivisionX + marginGridLeft();
        double coorY = i;
        canvas.drawCircle(Offset(coorX, coorY), _gridSize, _gridPointPaint);
      }
    }
  }

  Path mChartFigurePath = new Path();
  void _drawChart(Canvas canvas, Size size) {
    double prevX = marginGridLeft();
    double prevY = size.height - marginGridBottom();

    double maxValue = _chartDataSet.maxValue.y;

    mChartFigurePath.reset();
    mChartFigurePath.moveTo(prevX, prevY);

    for (int i = 0; i < pointsCount; i++) {
      double currentValue = _chartDataSet.points[i].y;
      double coorX = i * _chartGrid.scaleDivisionX + marginGridLeft();
      double coorY = _chartGrid.height * (maxValue - currentValue) / maxValue;

      double delta = _computeDelta(coorX, prevX);

      mChartFigurePath.cubicTo(
          prevX + delta, prevY,coorX - delta, coorY, coorX, coorY);

      prevX = coorX;
      prevY = coorY;
    }

    mChartFigurePath.lineTo(size.width, size.height - marginGridBottom());

    canvas.drawPath(mChartFigurePath, _chartFigurePaint);
  }

  double _flexure;

  double _computeDelta(double coorX, double prevX) {
    return (coorX - prevX) * _flexure;
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}