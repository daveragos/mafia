import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HowToPlayGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Play Guide'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Markdown(
          data: '''
# 🎭 How to Play Mafia Game

Mafia is a fun game of deception and negotiation. Here's a basic guide on how to play:

## 🎲 Setup

1. Enter the number of players and tap on "Generate Roles". The app will randomly assign each player a role - either "Mafia" 😈 or "Citizen" 😀.

2. Each player will then view their role one by one on the Role Display Screen.

## 🌙 Night Phase

1. All players close their eyes.

2. The Mafia members open their eyes and silently agree on a target to eliminate.

3. The Mafia members close their eyes again.

## ☀️ Day Phase

1. All players open their eyes.

2. The game master announces who was eliminated during the night.

3. All players debate and vote on who they think is a Mafia member. The player with the most votes is eliminated.

## 🔄 Repeat

Repeat the Night and Day phases until all Mafia members are eliminated (Citizens win) or the number of Mafia members equals the number of Citizens (Mafia wins).

Remember, the key to winning Mafia is deception and deduction. Good luck! 🍀
          ''',
        ),
      ),
    );
  }
}
