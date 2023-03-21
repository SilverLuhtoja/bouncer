import 'package:bouncer/utils/helpers.dart';
import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  final bool gameOver;
  final bool isWinner;

  const GameOver({super.key, required this.gameOver, required this.isWinner});

  @override
  Widget build(BuildContext context) {
    return !gameOver
        ? Container()
        : Stack(
            children: [
              Container(
                  alignment: const Alignment(0, -0.35),
                  child: Text(
                    isWinner ? "CONGRATULATION " : "",
                    style: style(50),
                  )),
              Container(
                  alignment: const Alignment(0, -0.2),
                  child: Text(
                    isWinner ? "> B O U N C E R < " : "G A M E O V E R",
                    style: style(40),
                  )),
              Container(
                alignment: const Alignment(0, -0.05),
                child: Text(
                  "( Tap to play again )",
                  style: style(30, false),
                ),
              ),
            ],
          );
  }
}
