import 'dart:async';
import 'package:flutter/material.dart';

class EmojiPage extends StatefulWidget {
  List<String>? roles;
  EmojiPage({super.key, this.roles});

  @override
  State<EmojiPage> createState() => _EmojiPageState();
}

class _EmojiPageState extends State<EmojiPage> {
  int _index = 0;
  bool _showRealEmoji = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emoji Page'),
      ),
      body: SafeArea(
          child: Center(
              child: widget.roles == null || widget.roles!.isEmpty
                  ? const Text("No roles generated")
                  : Column(
                      children: [
                        Text(
                            "Showing role ${_index + 1} of ${widget.roles!.length}"),
                        GestureDetector(
                            onLongPress: () {
                              setState(() {
                                _index++;
                                _showRealEmoji = true;
                                Timer(const Duration(seconds: 2), () {
                                  setState(() {
                                    _showRealEmoji = false;
                                  });
                                });
                              });
                            },
                            child: _index < widget.roles!.length
                                ? EmojiCard(
                                    role: widget.roles![_index],
                                    showRealEmoji: _showRealEmoji)
                                : const Text("All roles are shown")),
                      ],
                    ))),
    );
  }
}

class EmojiCard extends StatelessWidget {
  final String role;
  final bool showRealEmoji;
  EmojiCard({required this.role, required this.showRealEmoji});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: showRealEmoji
            ? role == "Role.Mafia"
                ? const Text(
                    "😈",
                    style: TextStyle(fontSize: 250, color: Colors.red),
                  )
                : const Text(
                    "😀",
                    style: TextStyle(fontSize: 250, color: Colors.green),
                  )
            : const Text(
                "🙂",
                style: TextStyle(fontSize: 250),
              ),
      ),
    );
  }
}
