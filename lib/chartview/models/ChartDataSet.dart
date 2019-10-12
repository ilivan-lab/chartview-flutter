import '../builders/ChartDataSetBuilder.dart';

import 'ChartPoint.dart';

///
/// ChartDataSet
///
/// authors: Ilya Litosh
///
class ChartDataSet {

  List<ChartPoint> _points = [];

  ChartPoint _maxValue = new ChartPoint();
  ChartPoint _minValue = new ChartPoint();

  ChartPoint get maxValue => _maxValue;

  ChartPoint get minValue => _minValue;

  List<ChartPoint> get points => _points;

  void set points(List<ChartPoint> points) {
    this._points = points;
  }

  void add(double x, double y) {
    ChartPoint chartPoint = new ChartPoint();
    chartPoint.x = x;
    chartPoint.y = y;

    if (_points.length == 0) {
      _minValue = chartPoint;
      _maxValue = chartPoint;
    }

    if (chartPoint.y > _maxValue.y) {
      _maxValue = chartPoint;
    }
    if (chartPoint.y < _minValue.y) {
      _minValue = chartPoint;
    }

    _points.add(chartPoint);
  }

  static ChartDataSetBuilder build() {
    return ChartDataSetBuilder();
  }

}
