import 'package:flutter/material.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Room"),
      ),
      body: const Center(
        child: Text("Join Room"),
      ),
    );
  }
}