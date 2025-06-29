import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_listview/page/welcome_page.dart';
import 'package:tugas_listview/page/main_home_page.dart';

// Global list kamera, akan diinisialisasi di awal
late List<CameraDescription> cameras;

// Global notifier untuk dark mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi kamera (wajib sebelum runApp)
  cameras = await availableCameras();

  // Ambil SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // Set dark mode sesuai penyimpanan terakhir
  isDarkModeNotifier.value = prefs.getBool('darkMode') ?? false;

  // Cek status login
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  // Jalankan aplikasi
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.green,
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: isLoggedIn ? const MainHomePage() : const WelcomePage(),
        );
      },
    );
  }
}
