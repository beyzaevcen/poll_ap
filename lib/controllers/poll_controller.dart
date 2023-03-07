import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:get/get.dart';
import 'package:poll_app/models/poll.dart';
import 'package:poll_app/screens/graph_page.dart';
import 'package:poll_app/services/api.dart';
import 'package:poll_app/utils/theme.dart';

class PollController extends GetxController {
  final polls = <PollModel>[].obs;
  final colorList = <Color>[
    CColors.mainColor,
    CColors.pink,
    CColors.blue,
    CColors.textTitle,
    CColors.subtitleColor,
    CColors.green,
    CColors.black
  ].obs;

  @override
  void onInit() async {
    final result = await Api.getAllPoll();
    polls.addAll(result ?? []);
    super.onInit();
  }

  void isVoted(int id, int index) async {
    final votes = await Api.patchVotes(id, index);
    polls[id] = polls[id].copyWith(voted: true, votes: votes);
    Get.dialog(GraphPage(poll: polls[id]));
  }

  void showSnackBar(BuildContext context) {
    Flushbar(
      backgroundColor: CColors.pink,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(16),
      icon: const Icon(
        Icons.error_outline,
        color: CColors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      message: "You've already voted this poll",
    ).show(context);
  }
}
