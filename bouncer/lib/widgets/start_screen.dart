import 'package:bouncer/utils/helpers.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.gameStarted});

  final bool gameStarted;

  @override
  Widget build(BuildContext context) {
    return gameStarted
        ? Container()
        : Container(
            alignment: const Alignment(0, -0.2),
            child: Text("Tap to play", style: style(60)),
          );
  }
}
