import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jumlah Total Angka',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const TotalAngkaPage(title: 'MENU JUMLAH TOTAL ANGKA'),
    );
  }
}

class TotalAngkaPage extends StatefulWidget {
  const TotalAngkaPage({super.key, required this.title});

  final String title; // Judul halaman (ditampilkan di AppBar)

  @override
  State<TotalAngkaPage> createState() => _TotalAngkaPageState();
}

class _TotalAngkaPageState extends State<TotalAngkaPage> {
  final TextEditingController _controller = TextEditingController();
  int _digitCount = 0;

  // Fungsi untuk menghitung jumlah digit
  void _countDigits() {
    String input = _controller.text.trim();

    // Hapus semua karakter selain angka (0-9) menggunakan RegExp
    String onlyDigits = input.replaceAll(RegExp(r'[^0-9]'), '');

    setState(() {
      _digitCount = onlyDigits.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        automaticallyImplyLeading: true, // back button otomatis kalau ada navigator
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Masukkan angka:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              //maxLength: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _countDigits,
              child: const Text("Hitung Jumlah Total Angka"),
            ),
            const SizedBox(height: 30),

            Text(
              "Jumlah Total Angka: $_digitCount",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
