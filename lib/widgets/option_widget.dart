import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poll_app/controllers/poll_controller.dart';

class OptionWidget extends GetView<PollController> {
  const OptionWidget({
    super.key,
    required this.optionText,
    required this.index,
    required this.id,
  });
  final String optionText;
  final int index;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        child: Container(
          width: double.infinity,
          height: Get.height / 15,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              optionText,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
        onTap: () {
          controller.isVoted(id, index);
        },
      ),
    );
  }
}
