import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tugas_listview/page/welcome_page.dart';
import 'package:tugas_listview/page/profile_page.dart';
import 'package:tugas_listview/page/list_page.dart';
import 'package:tugas_listview/page/checkbox_page.dart';
import 'package:tugas_listview/page/autocomplete.dart';
import 'package:tugas_listview/page/google_maps.dart';
import 'package:tugas_listview/page/camera_page.dart';
import 'package:tugas_listview/page/preference_page.dart';
import 'package:tugas_listview/page/thread_page.dart';
import 'package:tugas_listview/page/async_task_page.dart';
import 'package:tugas_listview/page/sms_autofill_page.dart';
import 'package:tugas_listview/page/grafik_page.dart'; // ✅ Tambahkan import GrafikPage

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int currentPage = 0;

  final List<Widget> _pages = [
    ProfilePage(),
    ListPage(),
    CheckboxPage(),
    AutocompletePage(),
    GoogleMapsPage(),
    CameraPage(),
    PreferencePage(),
    ThreadPage(),
    AsyncTaskPage(),
    SmsAutofillPage(),
    ChartPage(), // ✅ Tambahkan halaman grafik ke daftar
  ];

  void _navigateToPage(int index) {
    setState(() {
      currentPage = index;
    });
    Navigator.pop(context);
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const WelcomePage()),
      (route) => false,
    );
  }

  void _showTentangAplikasi() {
    showAboutDialog(
      context: context,
      applicationName: 'Tugas App',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2025 Muhamad Dimas',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Tentang Aplikasi',
            onPressed: _showTentangAplikasi,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _buildDrawerItem(Icons.person, 'Profile', 0),
            _buildDrawerItem(Icons.list, 'List', 1),
            _buildDrawerItem(Icons.check_box, 'CheckBox', 2),
            _buildDrawerItem(Icons.search, 'Autocomplete', 3),
            _buildDrawerItem(Icons.location_on, 'Google Maps', 4),
            _buildDrawerItem(Icons.camera, 'Kamera', 5),
            _buildDrawerItem(Icons.settings, 'Preferensi', 6),
            _buildDrawerItem(Icons.memory, 'Thread', 7),
            _buildDrawerItem(Icons.hourglass_bottom, 'Async Task', 8),
            _buildDrawerItem(Icons.sms, 'SMS Autofill', 9),
            _buildDrawerItem(Icons.pie_chart, 'Grafik', 10), // ✅ Tambahkan menu grafik
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: _pages[currentPage],
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int pageIndex) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => _navigateToPage(pageIndex),
    );
  }
}
