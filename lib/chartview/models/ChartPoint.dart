
///
/// ChartPoint
///
/// authors: Ilya Litosh
///
class ChartPoint {

  double _x;
  double _y;

  double get x => _x;

  void set x(double x) {
    this._x = x;
  }

  double get y => _y;

  void set y(double y) {
    this._y = y;
  }

  @override
  String toString() {
    return "x: $_x, y: $_y";
  }

}