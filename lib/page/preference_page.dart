import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_listview/main.dart'; // agar bisa akses isDarkModeNotifier

class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  final TextEditingController _usernameController = TextEditingController();
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameController.text = prefs.getString('username') ?? '';
      _isDarkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setBool('darkMode', _isDarkMode);

    // Perbarui dark mode global
    isDarkModeNotifier.value = _isDarkMode;

    // Tampilkan notifikasi
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Preferensi berhasil disimpan")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan"),
        automaticallyImplyLeading: false, // ⛔️ Menghilangkan tombol back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: _isDarkMode,
              onChanged: (val) {
                setState(() {
                  _isDarkMode = val;
                  isDarkModeNotifier.value = val;
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _savePreferences,
                icon: const Icon(Icons.save),
                label: const Text("Simpan Preferensi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
