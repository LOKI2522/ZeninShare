import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/services/socket_service.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  late String roomId;
  final SocketService socketService = SocketService();
  @override
  void initState() {
    super.initState();
    roomId = generateRoomId();
    socketService.connect();
  }

  String generateRoomId() {
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  void generateNewRoom() {
    setState(() {
      roomId = generateRoomId();
    });
  }

  void copyRoomId() {
    Clipboard.setData(ClipboardData(text: roomId));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Room ID copied successfully!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Room"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_tethering,
              size: 90,
              color: Colors.blue,
            ),

            const SizedBox(height: 25),

            const Text(
              "Room Created",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Share this Room ID with the receiver",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 25,
                ),
                child: Text(
                  roomId,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 6,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: copyRoomId,
                icon: const Icon(Icons.copy),
                label: const Text("Copy Room ID"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: generateNewRoom,
                icon: const Icon(Icons.refresh),
                label: const Text("Generate New Room"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const CircularProgressIndicator(),

            const SizedBox(height: 20),

            const Text(
              "Waiting for receiver...",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}