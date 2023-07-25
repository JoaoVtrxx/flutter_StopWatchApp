import 'package:flutter/material.dart';

class BottomButtonsWidget extends StatelessWidget {
  final bool isRunning;
  final Function reset;
  final Function startPause;
  final Function lap;

  const BottomButtonsWidget(
      {super.key,
      required this.isRunning,
      required this.reset,
      required this.startPause,
      required this.lap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          color: Colors.white,
          iconSize: 50,
          onPressed: () {
            reset();
          },
          icon: const Icon(Icons.restore),
        ),
        IconButton(
          color: Colors.white,
          iconSize: 80,
          onPressed: () {
            startPause();
          },
          icon: (isRunning)
              ? const Icon(Icons.pause_circle_outlined)
              : const Icon(Icons.play_circle_outline),
        ),
        IconButton(
          color: Colors.white,
          iconSize: 50,
          onPressed: () {
            lap();
          },
          icon: const Icon(Icons.flag),
        ),
      ],
    );
  }
}
