import 'package:flutter/material.dart';

class MenuExamplePage extends StatelessWidget {
  const MenuExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman dengan Menu'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'tentang') {
                showAboutDialog(
                  context: context,
                  applicationName: 'Tugas Listview App',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2025 Muhamad Dimas',
                );
              } else if (value == 'keluar') {
                Navigator.of(context).pop(); // atau jalankan logout logic
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'tentang',
                child: Text('Tentang Aplikasi'),
              ),
              const PopupMenuItem(
                value: 'keluar',
                child: Text('Keluar'),
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text("Ini halaman dengan menu di kanan atas."),
      ),
    );
  }
}
