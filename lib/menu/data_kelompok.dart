import 'package:flutter/material.dart';

class AnggotaPage extends StatelessWidget {
  const AnggotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> anggota = [
      {
        "nama": "Nabila Marwa Zakiyah",
        "nim": "124230001",
      },
      {
        "nama": "Nashwa Luthfiya",
        "nim": "124230016",
      },
      {
        "nama": "Francisca Aurasusi",
        "nim": "124230036",
      },
      {
        "nama": "Ahmad Nuruddin Muslim",
        "nim": "124230076",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Anggota Kelompok"),
        backgroundColor: const Color.fromARGB(255, 42, 126, 198),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: anggota.length,
          itemBuilder: (context, index) {
            final item = anggota[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 38, 81, 239),
                  child: Text(
                    item["nama"]![0], // inisial huruf depan
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  item["nama"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("NIM: ${item["nim"]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
