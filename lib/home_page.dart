import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mafia/emoji_page.dart';

enum Role {
  Mafia,
  Civilian,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _numPlayersController = TextEditingController();
  List<String>? roles;

  void _generateRoles() {
    int numPlayers = int.parse(_numPlayersController.text);
    roles = generateRoles(numPlayers);
    setState(() {});
  }

  List<String> generateRoles(int numPlayers) {
    List<String> roles = [];
    int mafia = numPlayers ~/ 3;
    for (int i = 0; i < mafia; i++) {
      roles.add(Role.Mafia.toString());
    }
    for (int i = 0; i < numPlayers - mafia; i++) {
      roles.add(Role.Civilian.toString());
    }
    roles.shuffle();
    return roles;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mafia 🎭 Game'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _numPlayersController,
                    decoration: const InputDecoration(
                      labelText: "Number of Players",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_numPlayersController.text.isNotEmpty) {
                        //first check if the input is number
                        if (int.tryParse(_numPlayersController.text) == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Invalid input")),
                          );
                        } else if (int.parse(_numPlayersController.text) < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Minimum 3 players")),
                          );
                        } else {
                          _generateRoles();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmojiPage(roles: roles),
                            ),
                          );
                        }
                      }
                      _numPlayersController.clear();
                    },
                    child: const Text("Generate Roles"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
