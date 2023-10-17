// import 'dart:math';
//
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// import '../dbmodels/SalesTrend.dart';
//
// class BaseBarChart extends StatefulWidget {
//   BaseBarChart({required this.data, this.title, this.yAxisCount = 5, super.key})
//       : assert(data.isNotEmpty, 'data should have at least 1 value');
//   final List<List<SalesTrends>> data;
//   final String? title;
//   final int yAxisCount;
//
//   final Color leftBarColor = Colors.greenAccent;
//   final Color rightBarColor = Colors.redAccent;
//   final Color avgColor = Colors.orangeAccent;
//
//   @override
//   State<StatefulWidget> createState() => BaseBarChartState();
// }
//
// class BaseBarChartState extends State<BaseBarChart> {
//   final double width = 7;
//
//   late List<BarChartGroupData> rawBarGroups;
//   late List<BarChartGroupData> showingBarGroups;
//
//   int touchedGroupIndex = -1;
//   double maxY = 5;
//
//   @override
//   void initState() {
//     super.initState();
//     List<BarChartGroupData> items = [];
//     int i = 0;
//     for (var e in widget.data[0]) {
//       final barGroup = makeGroupData(i, widget.data[0][i].sales,
//           (widget.data.length > 1) ? widget.data[1][i].sales : null);
//       items.add(barGroup);
//       i++;
//     }
//     double tempMaxY1 = widget.data[0]
//         .reduce((curr, next) => curr.sales > next.sales ? curr : next)
//         .sales;
//     double tempMaxY2 = (widget.data.length > 1)
//         ? widget.data[1]
//             .reduce((curr, next) => curr.sales > next.sales ? curr : next)
//             .sales
//         : 0;
//     double tempMaxY = max(tempMaxY2, tempMaxY1);
//
//     double tempAvg = tempMaxY / widget.yAxisCount;
//     maxY = widget.yAxisCount * tempAvg.ceilToDouble();
//     rawBarGroups = items;
//     showingBarGroups = rawBarGroups;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.4,
//       child: Padding(
//         padding: const EdgeInsets.only(right: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             if (widget.title != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Text(
//                   widget.title!,
//                   style: TextStyle(
//                     color: themes!.themeLabel1,
//                     fontSize: 14,
//                     fontWeight: FontWeight.normal,
//                     letterSpacing: 1.2,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             const SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: BarChart(
//                 BarChartData(
//                   maxY: maxY,
//                   barTouchData: BarTouchData(
//                     touchTooltipData: BarTouchTooltipData(
//                       tooltipBgColor: Colors.grey,
//                       fitInsideVertically: true,
//                       getTooltipItem: (
//                         BarChartGroupData group,
//                         int groupIndex,
//                         BarChartRodData rod,
//                         int rodIndex,
//                       ) {
//                         double val = 0;
//                         group.barRods.forEach((e) => val += e.toY);
//                         return BarTooltipItem(
//                           val.toString(),
//                           const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         );
//                       },
//                     ),
//                     /*touchCallback: (FlTouchEvent event, response) {
//                       if (response == null || response.spot == null) {
//                         setState(() {
//                           touchedGroupIndex = -1;
//                           showingBarGroups = List.of(rawBarGroups);
//                         });
//                         return;
//                       }
//
//                       touchedGroupIndex = response.spot!.touchedBarGroupIndex;
//
//                       setState(() {
//                         if (!event.isInterestedForInteractions) {
//                           touchedGroupIndex = -1;
//                           showingBarGroups = List.of(rawBarGroups);
//                           return;
//                         }
//                         showingBarGroups = List.of(rawBarGroups);
//                         if (touchedGroupIndex != -1) {
//                           var sum = 0.0;
//                           for (final rod
//                               in showingBarGroups[touchedGroupIndex].barRods) {
//                             sum += rod.toY;
//                           }
//                           final avg = sum /
//                               showingBarGroups[touchedGroupIndex]
//                                   .barRods
//                                   .length;
//
//                           showingBarGroups[touchedGroupIndex] =
//                               showingBarGroups[touchedGroupIndex].copyWith(
//                             barRods: showingBarGroups[touchedGroupIndex]
//                                 .barRods
//                                 .map((rod) {
//                               return rod.copyWith(
//                                   toY: avg, color: widget.avgColor);
//                             }).toList(),
//                           );
//                         }
//                       });
//                     },*/
//                   ),
//                   titlesData: FlTitlesData(
//                     show: true,
//                     rightTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                     topTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                     bottomTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         getTitlesWidget: bottomTitles,
//                         reservedSize: 42,
//                       ),
//                     ),
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 40,
//                         interval: 1,
//                         getTitlesWidget: leftTitles,
//                       ),
//                     ),
//                   ),
//                   borderData: FlBorderData(
//                     show: false,
//                   ),
//                   barGroups: showingBarGroups,
//                   gridData: FlGridData(show: false),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget leftTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.w500,
//       fontSize: 10,
//     );
//     String text;
//     if (value % (maxY / widget.yAxisCount) == 0) {
//       text = '${value}';
//     } else {
//       return Container();
//     }
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 0,
//       child: Text(text, style: style),
//     );
//   }
//
//   Widget bottomTitles(double value, TitleMeta meta) {
//     final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];
//
//     final Widget text = Text(
//       widget.data[0][value.toInt()].date,
//       style: const TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 10,
//       ),
//       textAlign: TextAlign.center,
//     );
//
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 10, //margin top
//       child: text,
//     );
//   }
//
//   BarChartGroupData makeGroupData(int x, double y1, double? y2) {
//     return BarChartGroupData(
//       barsSpace: 4,
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y1,
//           color: widget.leftBarColor,
//           width: width,
//         ),
//         if (y2 != null)
//           BarChartRodData(
//             toY: y2,
//             color: widget.rightBarColor,
//             width: width,
//           ),
//       ],
//     );
//   }
// }
