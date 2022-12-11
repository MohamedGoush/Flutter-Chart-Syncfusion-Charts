import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartDemo extends StatefulWidget {
  const BarChartDemo({super.key});

  @override
  State<BarChartDemo> createState() => _BarChartDemoState();
}

class _BarChartDemoState extends State<BarChartDemo> {
  @override
  void initState() {
    _chartData = getcharData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          series: <ChartSeries>[
            BarSeries<GDPData, String>(
              name: "GDP",
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              // dataLabelSettings: DataLabelSettings(
              //   isVisible: true,
              //   color: Colors.amber,
              // ),
            ),
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
          ),
          tooltipBehavior: _tooltipBehavior,
        ),
      ),
    );
  }
}

List<GDPData> getcharData() {
  List<GDPData> chartData = [
    GDPData('January', 1600),
    GDPData('Feb', 2490),
    GDPData('March', 7000),
    GDPData('Ociania', 1300),
    GDPData('Ociania', 1600),
    GDPData('Ociania', 1600),
  ];
  return chartData;
}

class GDPData {
  final String continent;
  final int gdp;

  GDPData(this.continent, this.gdp);
}
