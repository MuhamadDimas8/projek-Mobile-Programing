import 'package:flutter/material.dart';

class AsyncTaskPage extends StatefulWidget {
  const AsyncTaskPage({super.key});

  @override
  State<AsyncTaskPage> createState() => _AsyncTaskPageState();
}

class _AsyncTaskPageState extends State<AsyncTaskPage> {
  bool _loading = false;
  String _result = "";

  Future<void> _simulateAsyncTask() async {
    setState(() {
      _loading = true;
      _result = "";
    });

    // Simulasi delay seperti ambil data dari internet
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _loading = false;
      _result = "Data berhasil diambil dari async task!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async Task"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _loading ? null : _simulateAsyncTask,
              icon: const Icon(Icons.play_arrow),
              label: const Text("Jalankan Async Task"),
            ),
            const SizedBox(height: 30),
            if (_loading)
              const CircularProgressIndicator()
            else if (_result.isNotEmpty)
              Text(
                _result,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
