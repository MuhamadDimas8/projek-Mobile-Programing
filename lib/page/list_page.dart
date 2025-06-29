import 'package:flutter/material.dart';
import 'package:tugas_listview/page/pertemuan_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Pertemuan> pertemuan = [
    Pertemuan(title: 'Pertemuan 1', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 2', subtitle: 'Widget & Button'),
    Pertemuan(title: 'Pertemuan 3', subtitle: 'Activity & Intent'),
    Pertemuan(title: 'Pertemuan 4', subtitle: 'Toast & AlertDialog'),
    Pertemuan(title: 'Pertemuan 5', subtitle: 'ListView'),
    Pertemuan(title: 'Pertemuan 6', subtitle: 'Checkbox'),
    Pertemuan(title: 'Pertemuan 7', subtitle: 'Radio Button'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Pertemuan"),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false, // ⛔️ Hapus tombol back
      ),
      body: ListView.builder(
        itemCount: pertemuan.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              title: Text(pertemuan[index].title),
              subtitle: Text(pertemuan[index].subtitle),
              leading: CircleAvatar(
                child: Text(pertemuan[index].title.split(" ").last),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PertemuanPage(pertemuan: pertemuan[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Pertemuan {
  final String title;
  final String subtitle;

  Pertemuan({required this.title, required this.subtitle});
}
