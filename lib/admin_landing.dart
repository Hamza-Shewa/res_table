import 'package:demo/res_table/nav_buttons.dart';
import 'package:demo/sample_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminLanding extends StatefulWidget {
  const AdminLanding({Key? key}) : super(key: key);

  @override
  State<AdminLanding> createState() => _AdminLandingState();
}

class _AdminLandingState extends State<AdminLanding> {
  bool isCardView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        elevation: 0,
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.blue,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        'A',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      radius: 30,
                    ),
                    title: const Text('Ahmed'),
                    subtitle: const Text('job title'),
                  ),
                  const NavButtons('Home'),
                  const NavButtons('Employee Management'),
                  const NavButtons('Management page 3'),
                  const NavButtons('Management page 4'),
                  const NavButtons('Settings'),
                  const Spacer(),
                  const NavButtons('SignOut'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildLegendCustomizedChart(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      items(context, 'Tickets', '27'),
                      items(context, 'Most Tickets in', 'Tripoli'),
                      items(context, 'Tickets', '27'),
                      items(context, 'Tickets', '27'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget items(BuildContext context, String title, String content) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              content,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  List<ChartSampleData>? chartData;

  /// Returns the line chart with customized legends.
  SfCartesianChart _buildLegendCustomizedChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: isCardView ? '' : 'Automobile production by category'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        toggleSeriesVisibility: false,
        legendItemBuilder:
            (String name, dynamic series, dynamic point, int index) {
          return SizedBox(
              height: 30,
              width: 90,
              child: Row(children: <Widget>[
                Container(child: _getImage(index)),
                SizedBox(child: Text(series.name)),
              ]));
        },
      ),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines: const MajorGridLines(width: 0),
          interval: 1),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 120,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: _getLegendCustomizedSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series which need to render on the line chart.
  List<ChartSeries<ChartSampleData, num>> _getLegendCustomizedSeries() {
    return <ChartSeries<ChartSampleData, num>>[
      LineSeries<ChartSampleData, num>(
        width: 2,
        markerSettings: const MarkerSettings(isVisible: true),
        dataSource: chartData!,
        xValueMapper: (ChartSampleData sales, _) => sales.x as num,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        name: 'Truck',
      ),
      LineSeries<ChartSampleData, num>(
          markerSettings: const MarkerSettings(isVisible: true),
          width: 2,
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Car'),
      LineSeries<ChartSampleData, num>(
          markerSettings: const MarkerSettings(isVisible: true),
          width: 2,
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Bike'),
      LineSeries<ChartSampleData, num>(
          markerSettings: const MarkerSettings(isVisible: true),
          width: 2,
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          name: 'Bicycle')
    ];
  }

  /// Method to get the images for customizing the legends of line chart series.
  Icon _getImage(int index) {
    const List<Icon> images = <Icon>[
      Icon(Icons.car_rental),
      Icon(Icons.car_rental),
      Icon(Icons.car_rental),
      Icon(Icons.car_rental),
    ];
    return images[index];
  }

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 2005,
          y: 38,
          yValue: 49,
          secondSeriesYValue: 56,
          thirdSeriesYValue: 67),
      ChartSampleData(
          x: 2006,
          y: 20,
          yValue: 40,
          secondSeriesYValue: 50,
          thirdSeriesYValue: 60),
      ChartSampleData(
          x: 2007,
          y: 60,
          yValue: 72,
          secondSeriesYValue: 84,
          thirdSeriesYValue: 96),
      ChartSampleData(
          x: 2008,
          y: 50,
          yValue: 65,
          secondSeriesYValue: 80,
          thirdSeriesYValue: 90),
    ];
    super.initState();
  }
}
