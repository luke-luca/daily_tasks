import 'package:daily_tasks/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return Center(child: Text(text, style: CustomStyles.chartText));
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  final _barsColor = const Color.fromARGB(255, 255, 178, 143);

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                toY: 8,
                color: _barsColor,
                width: 20,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                toY: 10,
                color: _barsColor,
                width: 20,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                toY: 14,
                color: _barsColor,
                width: 20,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                toY: 15,
                color: _barsColor,
                width: 20,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                toY: 13,
                color: _barsColor,
                width: 20,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
                toY: 10,
                color: _barsColor,
                width: 20,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
                toY: 10,
                color: _barsColor,
                width: 20,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)))
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarChartBuider extends StatefulWidget {
  const BarChartBuider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartBuiderState();
}

class BarChartBuiderState extends State<BarChartBuider> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 2,
      child: Card(
        elevation: 0,
        child: _BarChart(),
      ),
    );
  }
}
