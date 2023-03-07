import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poll_app/controllers/poll_controller.dart';
import 'package:poll_app/models/poll.dart';
import 'package:poll_app/screens/poll_page.dart';
import 'package:poll_app/utils/theme.dart';

class PollWidget extends GetView<PollController> {
  const PollWidget({super.key, required this.poll});

  final PollModel poll;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: Get.height / 8,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
            color: poll.voted ? CColors.mainColor : CColors.backgroundcolor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                poll.title,
                style: const TextStyle(color: CColors.white, fontSize: 20),
              ),
            ),
            poll.voted
                ? Center(
                    child: Column(
                      children: [
                        poll.voted
                            ? const Icon(
                                Icons.check,
                                color: CColors.pink,
                              )
                            : const SizedBox(),
                        const Text(
                          "Voted",
                          style: TextStyle(color: CColors.pink),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      onTap: () {
        poll.voted
            ? controller.showSnackBar(context)
            : Get.to(PollPage(
                poll: poll,
              ));
      },
    );
  }
}
