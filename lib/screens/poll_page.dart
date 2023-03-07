import 'package:flutter/material.dart';
import 'package:poll_app/models/poll.dart';
import 'package:poll_app/utils/theme.dart';
import 'package:poll_app/widgets/option_widget.dart';

class PollPage extends StatelessWidget {
  const PollPage({Key? key, required this.poll}) : super(key: key);
  final PollModel poll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.backgroundcolor,
      ),
      backgroundColor: CColors.backgroundcolor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                poll.title,
                style: const TextStyle(color: CColors.subtitleColor, fontSize: 30),
              ),
              const SizedBox(height: 10),
              Text(
                poll.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: CColors.white, fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 10,
                color: CColors.pink,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    if (poll.options != null)
                      ...poll.options!
                          .asMap()
                          .entries
                          .map((e) => e.value != ""
                              ? OptionWidget(
                                  optionText: e.value,
                                  id: poll.id,
                                  index: e.key,
                                )
                              : const SizedBox())
                          .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
