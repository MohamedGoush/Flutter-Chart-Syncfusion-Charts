import 'package:flutter/material.dart';
import 'package:flutter_syncfusion_chart/charts/RadialbarChart.dart';
import 'package:flutter_syncfusion_chart/charts/barchart.dart';
import 'package:flutter_syncfusion_chart/charts/circularchart.dart';
import 'package:flutter_syncfusion_chart/charts/doughnutchat.dart';

import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      // home: CircularChartDemo(),
      // home: DoughnutChartDemo(),
      // home: RadialbarChartDemo(),
      home: BarChartDemo(),
    ),
  );
}
