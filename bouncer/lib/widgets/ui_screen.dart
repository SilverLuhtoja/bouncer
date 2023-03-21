import 'package:flutter/material.dart';
import '../utils/game_states.dart';

class UI extends StatelessWidget {
  const UI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.2),
      child: Text('$brickCount',
          style: TextStyle(
              fontSize: 140,
              color: Colors.deepPurple[800],
              fontFamily: 'Square')),
    );
  }
}
