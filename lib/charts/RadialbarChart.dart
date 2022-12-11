import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialbarChartDemo extends StatefulWidget {
  const RadialbarChartDemo({super.key});

  @override
  State<RadialbarChartDemo> createState() => _RadialbarChartDemoState();
}

class _RadialbarChartDemoState extends State<RadialbarChartDemo> {
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
            RadialBarSeries<GDPData, String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
              maximumValue: 3000,
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
