import 'dart:math';
import 'package:bouncer/utils/game_states.dart';
import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  final double brickX;
  final double brickY;
  final double brickWidth;
  final double brickHeight;
  final bool brickBroken;
  final Color? color;

  const Brick(
      {super.key,
      required this.brickWidth,
      required this.brickHeight,
      required this.brickX,
      required this.brickY,
      required this.brickBroken,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return brickBroken
        ? Container()
        : Container(
            alignment:
                Alignment((2 * brickX + brickWidth) / (2 - brickWidth), brickY),
            child: Container(
              height: MediaQuery.of(context).size.height * brickHeight / 2,
              width: MediaQuery.of(context).size.width * brickWidth / 2,
              decoration: BoxDecoration(
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          );
  }
}

List<Widget> getBricks(list) {
  return List.generate(list.length, (index) {
    return Brick(
        brickWidth: brickWidth,
        brickHeight: brickHeight,
        brickX: list[index][0],
        brickY: list[index][1],
        brickBroken: list[index][2],
        color: list[index][3]);
  });
}

List<Object> generateBricks() {
  List<Color?> colors = [
    Colors.orange[700],
    Colors.orange,
    Colors.orange[600],
    Colors.orangeAccent,
    Colors.orangeAccent[400],
    Colors.orangeAccent[700],
  ];
  List<Object> list = [];
  for (int i = 0; i < numberOfBricksInRow; i++) {
    for (int j = 0; j < numberOfRows; j++) {
      list.add([
        firstBrickX + i * (brickWidth + brickCap),
        firstBrickY + (j * 0.05),
        false,
        colors[Random().nextInt(3)]
      ]);
    }
  }
  return list;
}
