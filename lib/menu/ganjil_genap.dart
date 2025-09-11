import 'package:flutter/material.dart';// Mengimpor library Flutter Material yang berisi widget standar UI seperti Scaffold, AppBar, Button, dll.

class GanjilGenapPage extends StatefulWidget { // Mendefinisikan StatefulWidget GanjilGenapPage, artinya UI itu bisa berubah saat state nya berubah.
  const GanjilGenapPage({ // const itu konstan
    super.key,
  }); // Constructor untuk GanjilGenapPage, untuk identitas widget saat rebuild
  @override
  State<GanjilGenapPage> createState() => GanjilGenapPageState(); // Menghubungkan widget ini dengan state-nya (GanjilGenapPageState). 
}

class GanjilGenapPageState extends State<GanjilGenapPage> { // Kelas state untuk widget GanjilGenapPage. Semua logika dan UI dinamis diletakkan di sini.
  final TextEditingController _controller = TextEditingController(); // Controller untuk mengambil input dari TextField.
  String _result = ''; // Variabel untuk menyimpan hasil pengecekan ganjil/genap.

  void _checkGanjilGenap() {  // Fungsi untuk mengecek apakah angka yang dimasukkan ganjil atau genap.
    final inputText = _controller.text; // Mengambil teks dari TextField.
    if (inputText.isEmpty) {
      setState(() {
        _result = 'Silakan masukan angka terlebih dahulu';
      });
      return;
    } // Jika input kosong, menampilkan pesan error.

    final number = int.tryParse(inputText); // Mencoba mengubah input menjadi angka integer, akan gagal jika selain integer, menghasilkan null.
    if (number == null) { 
      setState(() {
        _result = 'Input harus berupa angka bulat';
      });
      return;
    } // Jika input bukan angka bulat, tampilkan pesan error.

    if (number % 2 == 0) {
      setState(() {
        _result = '$number adalah bilangan genap';
      });
    } else {
      setState(() {
        _result = '$number adalah bilangan ganjil';
      });
    } // Mengecek sisa bagi 2. Jika 0 maka genap, jika tidak maka ganjil.
  }

  @override
  Widget build(BuildContext context) { // Method build() untuk membangun UI widget.
    return Scaffold( // Scaffold adalah struktur dasar halaman Flutter dengan AppBar, body, dsb.
      appBar: AppBar(title: const Text('Menu Input Bilangan Ganjil Genap')), // Membuat AppBar dengan judul.
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Memberikan padding di seluruh sisi body.
        child: Column(
          children: [ // Mengatur widget di dalam body secara vertikal.
            TextField(
              controller: _controller, // Menghubungkan TextField dengan controller agar bisa ambil input.
              keyboardType: TextInputType.number, // Membatasi input hanya angka.
              decoration: const InputDecoration(
                labelText: 'Masukkan angka',
                border: OutlineInputBorder(),
              ), // Menambahkan label dan border pada TextField.
            ),
            const SizedBox(height: 20), // Memberikan jarak vertikal 20px.
            ElevatedButton(
              onPressed: _checkGanjilGenap, // Saat tombol ditekan, jalankan fungsi _checkGanjilGenap.
              child: const Text('Cek Ganjil / Genap'), // Teks pada tombol.
            ),
            const SizedBox(height: 20), // Jarak vertikal lagi 20px.
            Text(
              _result, // Menampilkan hasil cek ganjil/genap.
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Mengatur style teks hasil.
            ),
            const Spacer(),  // Mengisi ruang kosong di bawah agar tombol "Kembali" ada di paling bawah.
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                ); // Fungsi kembali ke halaman sebelumnya (homepage) menggunakan navigator
              },
              child: const Text('Kembali ke Home'),
            ), // Teks tombol kembali.
          ],
        ),
      ),
    );
  }
}
