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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mafia Role Generator'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _numPlayersController,
                decoration:
                    const InputDecoration(labelText: "Number of Players"),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_numPlayersController.text.isNotEmpty) {
                    if (int.parse(_numPlayersController.text) < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Minimum 6 players")));
                    } else {
                      _generateRoles();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmojiPage(roles: roles)));
                    }
                  }
                },
                child: const Text("Generate Roles"),
              ),
              // if (roles != null)
              //   Visibility(
              //       // visible: false, // Hide the list from all players
              //       child: ListView.builder(
              //           shrinkWrap: true,
              //           itemCount: roles!.length,
              //           itemBuilder: (context, index) => ListTile(
              //                 tileColor: roles![index] == Role.Mafia.toString()
              //                     ? Colors.red[100]
              //                     : Colors.green[100],
              //                 leading: const Icon(Icons.person),
              //                 title: Text("Player ${index + 1}"),
              //               ))),
            ],
          ),
        ),
      ),
    );
  }
}
