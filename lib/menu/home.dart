import 'package:flutter/material.dart';
import 'menu/data_kelompok.dart';
// import 'menu/kalkulator.dart';
import 'ganjil_genap.dart';
// import 'menu/total_angka.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 1 Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

// ===================== HOME PAGE =====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            SizedBox(
              height: 80, // tinggi tombol lebih kecil
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data Kelompok masih kosong")),
                  );
                },
                child: const Text(
                  "Menu Data Kelompok",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Kalkulator belum dibuat")),
                  );
                },
                child: const Text(
                  "Menu Kalkulator",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GanjilGenapPage(),
                    ),
                  );
                },
                child: const Text(
                  "Menu Input Bilangan\nGanjil / Genap",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Menu Jumlah Total Angka belum dibuat"),
                    ),
                  );
                },
                child: const Text(
                  "Menu Jumlah Total Angka",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
