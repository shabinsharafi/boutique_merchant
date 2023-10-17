import 'dart:ffi';
import 'dart:math';

import 'package:boutique_merchant/constants/constants.dart';
import 'package:boutique_merchant/models/WeeklySales.dart';
import 'package:boutique_merchant/provider/boutiqueVM.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/addBoutiqueScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/ShadowWidget.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../provider/userProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get tempWeeklyData => [
    WeeklySales(day:"Mon",sales:"4547"),
    WeeklySales(day:"Tue",sales:"5755"),
    WeeklySales(day:"Wed",sales:"7984"),
    WeeklySales(day:"Thr",sales:"3456"),
    WeeklySales(day:"Fri",sales:"1532"),
    WeeklySales(day:"Sat",sales:"9687"),
    WeeklySales(day:"Sun",sales:"4576"),
  ];

  late UserProvider userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<BoutiqueProvider>(context, listen: false).getBoutiqueDash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BoutiqueProvider>(builder: (context, provider, child) {
          return RefreshIndicator(
            onRefresh: () async {
              provider.getBoutiqueDash();
            },
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Styles.color.primaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15))),
                  padding: EdgeInsets.only(
                      bottom: Styles.dimens.screenPadding,
                      left: Styles.dimens.screenPadding,
                      right: Styles.dimens.screenPadding),
                  width: Styles.dimens.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Hi\n",
                            style: Styles.textStyle.normalTS
                                .copyWith(color: Colors.white),
                            children: [
                              TextSpan(
                                text: userProvider.user.name,
                                style: Styles.textStyle.headingTS
                                    .copyWith(color: Colors.white),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                if (userProvider.user.merchant != null)
                  Builder(
                    builder: (context) {
                      if(provider.isDashLoading)
                        return CircularProgressIndicator();
                      return Padding(
                        padding: EdgeInsets.all(Styles.dimens.screenPadding),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ShadowWidget(
                                      radius: 15,
                                      shadowOptions: ShadowOptions(blurRadius: 15),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: InkWell(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${provider.boutiqueDashResponse?.data?.totalOrders}',
                                                  style: Styles.textStyle.bigHeadingTS),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                'Orders',
                                                style: Styles.textStyle.smallTS,
                                              ),
                                            ],
                                          ),
                                          onTap: () {},
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: ShadowWidget(
                                      radius: 15,
                                      shadowOptions: ShadowOptions(blurRadius: 15),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: InkWell(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '$rupeeSymbol ${provider.boutiqueDashResponse?.data?.totalSales}',
                                                  style: Styles.textStyle.bigHeadingTS),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                'Sales',
                                                style: Styles.textStyle.smallTS,
                                              ),
                                            ],
                                          ),
                                          onTap: () {},
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ShadowWidget(
                                      radius: 15,
                                      shadowOptions: ShadowOptions(blurRadius: 15),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: InkWell(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${provider.boutiqueDashResponse?.data?.newOrders}',
                                                  style: Styles.textStyle.bigHeadingTS),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                'New\norders',
                                                style: Styles.textStyle.smallTS,
                                              ),
                                            ],
                                          ),
                                          onTap: () {},
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: ShadowWidget(
                                      radius: 15,
                                      shadowOptions: ShadowOptions(blurRadius: 15),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: InkWell(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${provider.boutiqueDashResponse?.data?.inProgressOrders}',
                                                  style: Styles.textStyle.bigHeadingTS),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                'Orders in progress',
                                                style: Styles.textStyle.smallTS,
                                              ),
                                            ],
                                          ),
                                          onTap: () {},
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: ShadowWidget(
                                      radius: 15,
                                      shadowOptions: ShadowOptions(blurRadius: 15),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: InkWell(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${provider.boutiqueDashResponse?.data?.completedOrders}',
                                                  style: Styles.textStyle.bigHeadingTS),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                'Orders\ndelivered',
                                                style: Styles.textStyle.smallTS,
                                              ),
                                            ],
                                          ),
                                          onTap: () {},
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ShadowWidget(
                                radius: 15,
                                shadowOptions: ShadowOptions(blurRadius: 15),
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: AspectRatio(
                                    aspectRatio: 1.4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Sales this week',
                                          style: Styles.textStyle.normalTS,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 16, left: 0),
                                            child: _LineChart(data: tempWeeklyData),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  )
                                )),
                          ],
                        ),
                      );
                    }
                  )
                else
                  Expanded(
                    child: Nothing(
                      "No boutique found",
                      title: "Create Boutique",
                      onClick: () {
                        NavigationService.changeScreen(AddBoutiqueScreen());
                      },
                    ),
                  ),
              ],
            ),
          );
        }
      ),
    );
  }
}


class _LineChart extends StatelessWidget {
  _LineChart({required this.data});

  final List<WeeklySales> data;

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
    maxX: data.length.toDouble()-0.9,
    maxY: 50,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
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
    targetChartData,
  ];

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
    if(value%1==0)
      text = Text(
          data[value.toInt()].day
              .toString() ,
          textAlign: TextAlign.center,
          style: style);
    else text=Text("");

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
      bottom: BorderSide(color: Colors.white.withOpacity(0.2), width: 4),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get targetChartData => LineChartBarData(
    isCurved: true,
    color: Colors.green,
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: getTargetFlSpot(),
  );

  getTargetFlSpot() {
    List<FlSpot> spot=[];
    int i=0;
    for (var e in data){
      print(e.sales);
      spot.add(FlSpot(i.toDouble(), (double.parse(e.sales!)/200)));
      i++;
    }
    return spot;
  }
}
