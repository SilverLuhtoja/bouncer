import 'package:bouncer/utils/game_states.dart';
import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final double x;
  final double y;

  const Ball({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.purple[100],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 20,
                blurRadius: 20,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          )),
    );
  }
}

void moveBall() {
  if (ballYDirection == Direction.DOWN) {
    ballY += ballSpeed;
  } else {
    ballY -= ballSpeed;
  }

  if (ballXDirection != Direction.NULL) {
    if (ballXDirection == Direction.LEFT) {
      ballX -= ballSpeed;
    } else {
      ballX += ballSpeed;
    }
  }
}

void updateDirection() {
  // if hits horizontal
  if (ballX <= -1) {
    ballXDirection = Direction.RIGHT;
  } else if (ballX >= 1) {
    ballXDirection = Direction.LEFT;
  }

  // if hits vertical
  double playerMiddlePoint = playerX + (playerWidth / 2);
  if (ballY > (0.85) && ballX >= playerX && ballX <= playerX + playerWidth) {
    ballXDirection = ballX >= playerX && ballX < playerMiddlePoint
        ? Direction.LEFT
        : Direction.RIGHT;
    ballYDirection = Direction.UP;
  } else if (ballY < -1) {
    ballYDirection = Direction.DOWN;
  }
}

String minDistanceFromBrick(
    double left, double right, double top, double bottom) {
  List<double> myList = [left, right, top, bottom];
  myList.sort();
  double currentMin = myList[0];

  if ((currentMin - left).abs() < 0.01) {
    return "left";
  } else if ((currentMin - right).abs() < 0.01) {
    return "right";
  } else if ((currentMin - top).abs() < 0.01) {
    return "top";
  } else if ((currentMin - bottom).abs() < 0.01) {
    return "bottom";
  }

  return '';
}
