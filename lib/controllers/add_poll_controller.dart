import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:poll_app/controllers/poll_controller.dart';
import 'package:poll_app/models/create_poll.dart';
import 'package:poll_app/services/api.dart';

class AddPollController extends GetxController {
  final title = TextEditingController();
  final description = TextEditingController();
  final options = <TextEditingController>[].obs;

  @override
  void onInit() {
    addOption();
    addOption();
    super.onInit();
  }

  @override
  void onClose() {
    title.dispose();
    description.dispose();
    for (var e in options) {
      e.dispose();
    }
    super.onClose();
  }

  void addOption() => options.add(TextEditingController());
  void removeOption(int idx) {
    options.removeAt(idx);
  }

  void createPoll() async {
    final titleStr = title.text.trim();
    final descriptionStr = description.text.trim();

    if (titleStr.isEmpty || descriptionStr.isEmpty) {
      EasyLoading.showError("Title or description can't be empty");
      return;
    }

    final poll = CreatePoll(
        title: titleStr,
        description: descriptionStr,
        options: options.map((e) => e.text.trim()).toList());

    final newPoll = await Api.addPoll(poll);
    if (newPoll != null) {
      Get.back();
      Get.find<PollController>().polls.add(newPoll);
      EasyLoading.showSuccess('Poll succesfully added!');
    }
  }
}
