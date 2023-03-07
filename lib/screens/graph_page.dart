import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:poll_app/controllers/poll_controller.dart';
import 'package:poll_app/models/poll.dart';
import 'package:poll_app/utils/theme.dart';

class GraphPage extends GetView<PollController> {
  const GraphPage({super.key, required this.poll});
  final PollModel poll;
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {};
    final options = poll.options;
    for (var i = 0; i < options!.length; i++) {
      dataMap[options[i]] = poll.votes![i].toDouble();
    }

    return AlertDialog(
        content: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: Get.height / 3,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Poll Percentages",
            style: TextStyle(color: CColors.mainColor, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: controller.colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            centerText: "VOTES",
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: CColors.mainColor,
              ),
              onPressed: () {
                Get.back();
                Get.back();
              },
              icon: const Icon(Icons.home),
              label: const Text("Come back home")),
        ],
      ),
    ));
  }
}
