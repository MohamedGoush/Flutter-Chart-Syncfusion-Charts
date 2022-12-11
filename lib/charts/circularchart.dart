import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChartDemo extends StatefulWidget {
  const CircularChartDemo({super.key});

  @override
  State<CircularChartDemo> createState() => _CircularChartDemoState();
}

class _CircularChartDemoState extends State<CircularChartDemo> {
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
        body: SfCircularChart(
          tooltipBehavior: _tooltipBehavior,
          title: ChartTitle(
            text: "Continents wise GDP -2022\n (in Billions of USD)",
          ),
          series: <CircularSeries>[
            PieSeries<GDPData, String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
            ),
          ],
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            // overflowMode: LegendItemOverflowMode.scroll,
          ),
        ),
      ),
    );
  }
}

List<GDPData> getcharData() {
  List<GDPData> chartData = [
    GDPData('Ociania', 1600),
    GDPData('Ociania', 2490),
    GDPData('Ociania', 2900),
    GDPData('Ociania', 1600),
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
