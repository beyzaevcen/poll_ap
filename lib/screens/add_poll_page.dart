import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poll_app/controllers/add_poll_controller.dart';
import 'package:poll_app/utils/theme.dart';

class AddPollPage extends StatelessWidget {
  const AddPollPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPollController());

    return Scaffold(
      backgroundColor: CColors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: CColors.backgroundcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add Poll",
              style: TextStyle(color: CColors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  TextFormField(
                    controller: controller.title,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: CColors.white,
                      focusedErrorBorder: const OutlineInputBorder(gapPadding: 0),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Title",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.description,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: CColors.white,
                      focusedErrorBorder: const OutlineInputBorder(gapPadding: 0),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Description",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => Column(
                        children: [
                          ...controller.options.asMap().entries.map(
                                (kv) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: TextFormField(
                                    controller: kv.value,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          controller.options.removeAt(kv.key);
                                        },
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      filled: true,
                                      fillColor: CColors.white,
                                      focusedErrorBorder: const OutlineInputBorder(gapPadding: 0),
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      hintText: "Option ${kv.key + 1}",
                                    ),
                                  ),
                                ),
                              ),
                        ],
                      )),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: CColors.backgroundcolor),
                    onPressed: controller.addOption,
                    icon: const Icon(
                      Icons.add,
                      color: CColors.white,
                    ),
                    label: const Text("Add Option"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.pink,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: controller.createPoll,
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
