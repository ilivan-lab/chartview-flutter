
import '../models/ChartDataSet.dart';

///
/// ChartDataSetBuilder
///
/// Builder for ChartDataSet entity
///
/// authors: Ilya Litosh
///
class ChartDataSetBuilder {

  ChartDataSet mDataSet = new ChartDataSet();

  ChartDataSetBuilder add(double x, double y) {
    mDataSet.add(x, y);

    return this;
  }

  ChartDataSet build() {
    return mDataSet;
  }

}