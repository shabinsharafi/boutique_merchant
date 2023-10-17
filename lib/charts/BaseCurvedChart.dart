/*
import 'package:boutique_merchant/dbmodels/Route.dart';
import 'package:boutique_merchant/dbmodels/SalesTrend.dart';
import 'package:boutique_merchant/dbmodels/Themes.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:boutique_merchant/helpers/service_locator.dart';
import 'package:get/get.dart';

class BaseCurvedChart extends StatefulWidget {
  BaseCurvedChart({required this.data, this.title, this.yAxisCount=5, super.key}):assert(data.isNotEmpty,'data should have at least 1 value');

  final List<List<SalesTrends>> data;
  final String? title;
  final int yAxisCount;

  @override
  State<StatefulWidget> createState() => BaseCurvedChartState();
}

class BaseCurvedChartState extends State<BaseCurvedChart> {
  Themes? themes;

  @override
  void initState() {
    super.initState();
    themes = locator<Themes>();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: Material(
        elevation: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  widget.title!,
                  style: TextStyle(
                    color: themes!.themeLabel1,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 16, left: 6),
                child: _LineChart(data: widget.data,yAxisCount: 5,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  _LineChart({required this.data ,this.yAxisCount=5,});

  final List<List<SalesTrends>> data;
  final Themes themes = locator<Themes>();
  final int yAxisCount;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      swapAnimationDuration: Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: -0.1,
        maxX: data[0].length.toDouble() - 0.9,
        maxY: 50,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          fitInsideVertically: true,
          tooltipBgColor: Colors.white.withOpacity(0.8),
          tooltipRoundedRadius: 10,
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        chartData1,
        if (data.length > 1) chartData2,
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 10:
        text = '10k';
        break;
      case 20:
        text = '20k';
        break;
      case 30:
        text = '30k';
        break;
      case 40:
        text = '40k';
        break;
      case 50:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
    );
    Widget text;
    if (value % 1 == 0)
      text = Text(data[0][value.toInt()].date.toString(),
          textAlign: TextAlign.center, style: style);
    else
      text = Text("");

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: true);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: themes.themeBg!.withOpacity(0.2), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get chartData1 => LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: getData1FlSpot(),
      );

  //var spots2=routes.map((element) { }).toList();
  LineChartBarData get chartData2 => LineChartBarData(
        isCurved: true,
        color: Colors.orange,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.pink.withOpacity(0),
        ),
        spots: getData2FlSpot(),
      );

  getData1FlSpot() {
    List<FlSpot> spot = [];
    int i = 0;
    for (var e in data[0]) {
      spot.add(FlSpot(i.toDouble(), e.sales));
      i++;
    }
    return spot;
  }

  getData2FlSpot() {
    List<FlSpot> spot = [];
    int i = 0;
    for (var e in data[1]) {
      spot.add(FlSpot(i.toDouble(), e.sales));
      i++;
    }
    return spot;
  }
}
*/
