import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

class ThreadPage extends StatefulWidget {
  const ThreadPage({super.key});

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  String result = "Belum diproses";
  bool isProcessing = false;

  Future<void> startHeavyTask() async {
    setState(() {
      isProcessing = true;
      result = "Sedang memproses...";
    });

    final receivePort = ReceivePort();
    await Isolate.spawn(_heavyCalculation, receivePort.sendPort);

    receivePort.listen((data) {
      setState(() {
        result = "Hasil: $data";
        isProcessing = false;
      });
      receivePort.close();
    });
  }

  // Fungsi berat dijalankan di Isolate
  static void _heavyCalculation(SendPort sendPort) {
    int total = 0;
    for (int i = 0; i < 100000000; i++) {
      total += i;
    }
    sendPort.send(total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thread Page (Isolate)'),
        automaticallyImplyLeading: false, // ⛔️ Menghilangkan back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isProcessing
                  ? const CircularProgressIndicator(key: ValueKey('loading'))
                  : ElevatedButton.icon(
                      key: const ValueKey('button'),
                      onPressed: startHeavyTask,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text("Mulai Proses Berat"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
