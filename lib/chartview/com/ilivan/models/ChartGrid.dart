
import '../builders/ChartGridBuilder.dart';

import 'ChartPoint.dart';

///
/// ChartGrid
///
/// authors: Ilya Litosh
///
class ChartGrid {

  List<ChartPoint> _points = [];
  List<ChartPoint> get points => _points;

  double _width;
  double get width => _width;

  void set width(double width) {
    this._width = width;
  }

  double _height;
  double get height => _height;

  void set height(double height) {
    this._height = height;
  }

  double _marginLeft;
  double get marginLeft => _marginLeft;

  void set marginLeft(double marginLeft) {
    this._marginLeft = marginLeft;
  }

  double _marginBottom;
  double get marginBottom => _marginBottom;

  void set marginBottom(double marginBottom) {
    this._marginBottom = marginBottom;
  }

  double _scaleDivisionX;
  double get scaleDivisionX => _scaleDivisionX;

  void set scaleDivisionX(double scaleDivisionX) {
    this._scaleDivisionX = scaleDivisionX;
  }

  double _scaleDivisionY;
  double get scaleDivisionY => _scaleDivisionY;

  void set scaleDivisionY(double scaleDivisionY) {
    this._scaleDivisionY = scaleDivisionY;
  }

  static ChartGridBuilder build() {
    return ChartGridBuilder();
  }

}