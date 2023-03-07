import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poll_app/controllers/poll_controller.dart';
import 'package:poll_app/screens/add_poll_page.dart';
import 'package:poll_app/services/api.dart';
import 'package:poll_app/utils/theme.dart';
import 'package:poll_app/widgets/poll_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PollController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.backgroundcolor,
        title: const Text("Go Poll ♡ "),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: CColors.pink,
        label: Row(children: const [Text("Add Poll"), Icon(Icons.add)]),
        onPressed: () => Get.to(const AddPollPage()),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Api.getAllPoll();
        },
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.all(10),
            children: [
              ...controller.polls.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: PollWidget(poll: e),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
