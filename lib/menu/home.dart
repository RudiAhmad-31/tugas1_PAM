import 'package:flutter/material.dart';
import 'data_kelompok.dart';
import 'kalkulator.dart';

class HomePage extends StatelessWidget {
  final List<String> anggota = ["Rudi", "Budi", "Sudi", "Dudi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu Utama")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("Data Kelompok"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DataKelompokPage(anggota: anggota),
                    ),
                  );
                }),
            ElevatedButton(
                child: Text("Kalkulator"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KalkulatorPage()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
