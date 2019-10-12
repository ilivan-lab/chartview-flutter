
import '../models/ChartGrid.dart';
import '../models/ChartPoint.dart';

///
/// ChartGridBuilder
///
/// Builder for ChartGrid entity
///
/// authors: Ilya Litosh
///
class ChartGridBuilder {

  ChartGrid mChartGrid = new ChartGrid();

  ChartGridBuilder point(double x, double y) {
    ChartPoint chartPoint = new ChartPoint();
    chartPoint.x = x;
    chartPoint.y = y;

    mChartGrid.points.add(chartPoint);

    return this;
  }

  ChartGridBuilder width(double width) {
    mChartGrid.width = width;

    return this;
  }

  ChartGridBuilder height(double height) {
    mChartGrid.height = height;

    return this;
  }

  ChartGridBuilder marginLeft(double marginLeft) {
    mChartGrid.marginLeft = marginLeft;

    return this;
  }

  ChartGridBuilder marginBottom(double marginBottom) {
    mChartGrid.marginBottom = marginBottom;

    return this;
  }

  ChartGridBuilder scaleDivisionX(double scaleDivisionX) {
    mChartGrid.scaleDivisionX = scaleDivisionX;

    return this;
  }

  ChartGridBuilder scaleDivisionY(double scaleDivisionY) {
    mChartGrid.scaleDivisionY = scaleDivisionY;

    return this;
  }

  ChartGrid build() {
    return mChartGrid;
  }

}
