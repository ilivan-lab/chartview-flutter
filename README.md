# ChartView-Flutter

Introduction
------------
Flutter UI component for shows charts. <br><br>

UI/UX design: [Victoria Kosmovich](https://www.behance.net/vkosmovich)

Demo
----

![chartview1](imgres/chartview-demo.gif)

Get started
-----------

To start you have to clone [chartview-flutter](https://github.com/ilivan-lab/chartview-flutter) project.


Usage
-----

Generate data set for the chart:
```dart
ChartDataSet generatedChartDataSet = ChartDataSet.builder()
        .add(0, 1.0)
        .add(1, 2.0)
        .add(2, 1.5)
        .add(3, 3.1)
        .add(4, 1.7)
        .build();
```
Create instance of **ChartView**:
```dart
ChartView chartView = ChartView(
  chartDataSet: generatedChartDataSet,
);
```

Use it into Layout:
```dart
Widget _createChartViewWidget() {
  return Container(
    height: 300,
    child: chartView,
    margin: EdgeInsets.all(10),
  );
}
```

Available options:
```dart
ChartView chartView =  ChartView(
  chartDataSet: createChartDataSet(),
  labelsTextColor: Colors.black12,
  labelsTextSize: 14,
  gridLineColor: Colors.black,
  gridLineWidth: 1,
  gridSize: 1,
  gridStartColor: Colors.amber,
  gridEndColor: Colors.amberAccent,
  flexure: 0.6,
  chartLineStartColor: Colors.blue,
  chartLineEndColor: Colors.deepOrange,
  isPreview: false
);
```
`labelsTextSize` - size of labels at the axisY and axisX. <br>
`labelsTextFont` - font of labels at the axisY and axisX. <br>
`labelsTextColor` - color of labels at the axisY and axisX. <br>
`gridLineWidth` - width of the horizontal lines, which located on the grid. <br>
`gridLineColor` - color of the horizontal lines, which located on the grid. <br>
`gridSize` - size of dots, which located on the grid. You may set this value like `0dp`, if you want to hide this dots. <br>
`gridStartColor` - start color for shader of the dots, which located on the grid. <br>
`gridEndColor` - end color for shader of the dots, which located on the grid. <br>
If you don't want to use gradient filling for dots on the grid, you may use the same values for `gridEndColor` and `gridStartColor` parameters. <br>
`chartLineStartColor` - start color of chart line. <br>
`chartLineEndColor` - end color of chart line. <br>
If you don't want to use gradient filling for chart line on the grid, you may use the same values for `chartLineEndColor` and `chartLineStartColor` parameters. <br>
`flexure` - line bending coefficient (use `0..1` values). You may use this value like `0` if you don't need to curve chart line. <br>
`isPreview` - prefer to use just for debug mode, if you will use hot reload mode. It provides to check layout of ChartView with generated dataset. <br><br>

License
-------

ChartView is licensed with the Apache License 2.0. For more details, see [LICENSE](LICENSE).


