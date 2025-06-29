import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool isGameChecked = true;
  bool isHobbyChecked = true;

  final List<String> gameList = [
    'Honkai Star Rail',
    'Wuthering Waves',
    'Persona 5 Royal',
    'Planet Zoo',
  ];

  final List<String> hobbyList = [
    'Photography',
    'Music',
    'Gaming',
    'Nonton Film',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 218, 103),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 214, 29, 4),
        title: const Text('My Interests'),
        centerTitle: true,
        automaticallyImplyLeading: false, // ⛔️ Menghilangkan tombol back
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          menuCheckbox('My Game', isGameChecked, (value) {
            setState(() {
              isGameChecked = value!;
            });
          }),
          const SizedBox(height: 16),
          menuCheckbox('My Hobby', isHobbyChecked, (value) {
            setState(() {
              isHobbyChecked = value!;
            });
          }),
          const SizedBox(height: 32),
          const Text(
            'Menu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              getSelectedMenu(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget untuk Checkbox yang dilapisi container bergaya
  Widget menuCheckbox(String title, bool value, Function(bool?) onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.blue,
      ),
    );
  }

  /// Menggabungkan list yang dipilih ke dalam string
  String getSelectedMenu() {
    List<String> selectedMenu = [];

    if (isGameChecked) {
      selectedMenu.addAll(gameList);
    }
    if (isHobbyChecked) {
      selectedMenu.addAll(hobbyList);
    }

    return selectedMenu.isEmpty
        ? 'Tidak ada yang dipilih'
        : selectedMenu.join(', ');
  }
}
