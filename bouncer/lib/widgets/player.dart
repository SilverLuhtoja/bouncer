import 'package:bouncer/utils/game_states.dart';
import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  final double x;
  final double playerWidth;

  const MyPlayer({super.key, required this.x, required this.playerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * x + playerWidth) / (2 - playerWidth), 0.9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: 20,
          width: MediaQuery.of(context).size.width * playerWidth / 2,
          color: Colors.black45,
        ),
      ),
    );
  }
}

void updatePlayerPosition(playerSpeed) {
  if (-1 > playerX && playerX < 0) playerX = -1;
  if (1 < playerX + playerWidth && playerX > 0) playerX = 1 - playerWidth;
  if (-1 <= playerX && playerX <= 1) playerX -= playerSpeed;
}
