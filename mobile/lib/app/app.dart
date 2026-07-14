import 'package:flutter/material.dart';

class ZeninShareApp extends StatelessWidget {
  const ZeninShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZeninShare',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ZeninShare'),
        ),
        body: const Center(
          child: Text(
            'Welcome to ZeninShare',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}