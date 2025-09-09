import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController listController = TextEditingController();

  String hasil = "";

  void operasi(String op) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    double res = 0;

    if (op == "+") res = num1 + num2;
    if (op == "-") res = num1 - num2;
    if (op == "x") res = num1 * num2;
    if (op == "/") {
      if (num2 != 0) {
        res = num1 / num2;
      } else {
        hasil = "Error: Pembagian dengan 0!";
        setState(() {});
        return;
      }
    }

    setState(() {
      hasil = "Hasil: $res";
    });
  }

  void cekGanjilGenap() {
    int num = int.tryParse(num1Controller.text) ?? 0;
    setState(() {
      hasil = num % 2 == 0 ? "$num adalah Genap" : "$num adalah Ganjil";
    });
  }

  void jumlahTotal() {
    List<String> angkaStr = listController.text.split(",");
    int total = 0;
    for (var str in angkaStr) {
      total += int.tryParse(str.trim()) ?? 0;
    }
    setState(() {
      hasil = "Jumlah Total = $total";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Angka 1"),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Angka 2"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => operasi("+"), child: Text("+")),
                ElevatedButton(onPressed: () => operasi("-"), child: Text("-")),
                ElevatedButton(onPressed: () => operasi("x"), child: Text("x")),
                ElevatedButton(onPressed: () => operasi("/"), child: Text("/")),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: cekGanjilGenap,
              child: Text("Cek Ganjil/Genap (Angka 1)"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: listController,
              decoration: InputDecoration(
                labelText: "Input angka dipisah koma (misal: 1,2,3,4)",
              ),
            ),
            ElevatedButton(
              onPressed: jumlahTotal,
              child: Text("Hitung Jumlah Total"),
            ),
            SizedBox(height: 20),
            Text(
              hasil,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
