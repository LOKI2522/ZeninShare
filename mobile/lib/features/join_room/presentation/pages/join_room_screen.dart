import 'package:flutter/material.dart';
import '../../../../core/services/socket_service.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController roomController = TextEditingController();
  final SocketService socketService = SocketService();

  @override
  void initState() {
    super.initState();
    socketService.connect();
  }

  @override
  void dispose() {
    roomController.dispose();
    super.dispose();
  }

  void joinRoom() {
    String roomId = roomController.text.trim();

    if (roomId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a Room ID")),
      );
      return;
    }

    socketService.joinRoom(roomId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Room"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: roomController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Room ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: joinRoom,
                child: const Text("Join Room"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}