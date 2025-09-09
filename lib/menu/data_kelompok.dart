import 'package:flutter/material.dart';

class DataKelompokPage extends StatelessWidget {
  final List<String> anggota;

  DataKelompokPage({required this.anggota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Kelompok")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Anggota Kelompok Mahasiswa Sistem Informasi UPNVYK:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...anggota.map(
            (nama) => ListTile(
              leading: Icon(Icons.person),
              title: Text(nama),
              subtitle: Text("Prodi Sistem Informasi UPNVYK"),
            ),
          ),
        ],
      ),
    );
  }
}
