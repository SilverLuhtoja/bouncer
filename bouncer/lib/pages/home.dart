import 'dart:async';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:bouncer/utils/game_states.dart';
import 'package:bouncer/widgets/ball.dart';
import 'package:bouncer/widgets/brick.dart';
import 'package:bouncer/widgets/game_over_screen.dart';
import 'package:bouncer/widgets/player.dart';
import 'package:bouncer/widgets/start_screen.dart';
import 'package:bouncer/widgets/ui_screen.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static dynamic allBricks = generateBricks();

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      playerSpeed = event.x.round() * 0.0001;
    });
  }

  void startGame() async {
    resetGame();
    await Future.delayed(Duration(seconds: 1));
    Timer.periodic(Duration(microseconds: 10), (timer) {
      updatePlayerPosition(playerSpeed);
      setState(() {
        updateDirection();
        moveBall();

        isWinner = checkWinCondition();
        if (isPlayerDead() || isWinner) {
          timer.cancel();
          isGameOver = true;
        }
      });

      checkForBrokenBricks();
    });
  }

  bool isPlayerDead() => ballY >= 1 ? true : false;

  bool checkWinCondition() => brickCount == 0 ? true : false;

  void checkForBrokenBricks() {
    for (int i = 0; i < allBricks.length; i++) {
      if (ballX >= allBricks[i][0] &&
          ballX <= allBricks[i][0] + playerWidth &&
          ballY <= allBricks[i][1] + brickHeight &&
          allBricks[i][2] == false) {
        setState(() {
          brickCount -= 1;
          ballSpeed += 0.00001;
          playerWidth -= 0.005;
          allBricks[i][2] = true;

          double leftSideDist = (allBricks[i][0] - ballX).abs();
          double rightSideDist = (allBricks[i][0] + brickWidth - ballX).abs();
          double topSideDist = (allBricks[i][1] - ballY).abs();
          double bottomSideDist = (allBricks[i][1] + brickHeight - ballY).abs();

          String min = minDistanceFromBrick(
              leftSideDist, rightSideDist, topSideDist, bottomSideDist);
          switch (min) {
            case 'left':
              ballXDirection = Direction.LEFT;
              break;
            case 'right':
              ballXDirection = Direction.RIGHT;
              break;
            case 'top':
              ballYDirection = Direction.UP;
              break;
            case 'bottom':
              ballYDirection = Direction.DOWN;
              break;
          }
        });
      }
    }
  }

  void resetGame() {
    ballX = 0.0;
    ballY = 0.0;
    ballSpeed = 0.0001;
    ballYDirection = Direction.DOWN;
    ballXDirection = Direction.NULL;
    playerX = 0.0;
    allBricks = generateBricks();
    gameStarted = true;
    isGameOver = false;
    isWinner = false;
    brickCount = numberOfBricksInRow * numberOfRows;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.deepPurple,
          body: AnimateGradient(
            duration: Duration(seconds: 5),
            primaryColors: const [
              Colors.deepPurple,
              Colors.deepPurpleAccent,
            ],
            secondaryColors: const [
              Colors.deepPurple,
              Colors.purple,
            ],
            child: Stack(
              children: [
                gameStarted
                    ? Stack(
                        children: [
                          UI(),
                          GameOver(gameOver: isGameOver, isWinner: isWinner),
                          Ball(x: ballX, y: ballY),
                          MyPlayer(x: playerX, playerWidth: playerWidth),
                          for (dynamic brick in getBricks(allBricks)) brick
                        ],
                      )
                    : StartScreen(gameStarted: gameStarted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
