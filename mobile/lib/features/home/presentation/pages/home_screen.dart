import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ZeninShare",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.share_rounded,
              size: 90,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              "Share Files Instantly",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Fast • Secure • Wireless",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 50),

            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Send Screen
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Send Files"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Receive Screen
              },
              icon: const Icon(Icons.download),
              label: const Text("Receive Files"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.history),
                title: const Text("Transfer History"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}