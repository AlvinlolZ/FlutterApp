import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class line_chart extends StatefulWidget {
  @override
  State<line_chart> createState() => _line_chartState();
}

class _line_chartState extends State<line_chart> {
  // final List<Color> colors = [
  // const  Color.fromARGB(255, 29, 9, 64),
  // ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          minY: 0,
          maxX: 7,
          maxY: 30,
          // backgroundColor: const Color.fromARGB(255, 30, 13, 58),
          titlesData: const FlTitlesData(
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: bottomTitlesWidget,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 5,
                getTitlesWidget: LeftTitlesWidget,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(
              color: const Color.fromARGB(255, 30, 13, 58),
            ),
          ),
          gridData: FlGridData(
            drawVerticalLine: false,
            drawHorizontalLine: true,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: Colors.grey,
                strokeWidth: 1,
              );
            },
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(1, 1),
                FlSpot(2, 5),
                FlSpot(3, 6),
              ],
              isCurved: true,
              gradient: LinearGradient(colors: [
                Colors.cyanAccent,
                Color.fromARGB(255, 20, 28, 185)
              ]),
              barWidth: 5,
            ),
          ],
        ),
      );
}

Widget bottomTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.grey,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('MON', style: style);
      break;
    case 1:
      text = const Text('TUE', style: style);
      break;
    case 2:
      text = const Text('WED', style: style);
      break;
    case 3:
      text = const Text('THU', style: style);
      break;
    case 4:
      text = const Text('FRI', style: style);
      break;
    case 5:
      text = const Text('SAT', style: style);
      break;
    case 6:
      text = const Text('SUN', style: style);
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget LeftTitlesWidget(double value, TitleMeta meta) {
  final int cigarettes = value.toInt();
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.grey,
  );
  Widget text;
  switch (value.toInt()) {
    default:
      text = Text(
        '$cigarettes',
        style: style,
      );
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
