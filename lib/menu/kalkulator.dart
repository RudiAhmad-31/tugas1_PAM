import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String input = "";
  String hasil = "";

  bool _isOperator(String s) {
    return s == "+" || s == "-" || s == "x" || s == "÷" || s == "*" || s == "/";
  }

  void tekanTombol(String value) {
    setState(() {
      if (value == "AC") {
        input = "";
        hasil = "";
        return;
      }

      if (value == "⌫") {
        if (input.isNotEmpty) input = input.substring(0, input.length - 1);
        return;
      }

      if (value == "=") {
        hasil = _evaluateExpression(input);
        return;
      }

      // Jika user menekan operator:
      if (_isOperator(value)) {
        if (input.isEmpty) {
          // hanya izinkan unary minus di awal
          if (value == "-") {
            input += value;
          }
          return;
        } else {
          // jika karakter terakhir adalah operator -> ganti operator terakhir
          String last = input[input.length - 1];
          if (_isOperator(last)) {
            // izinkan mengganti operator terakhir
            input = input.substring(0, input.length - 1) + value;
          } else {
            input += value;
          }
          return;
        }
      }

      // default: angka atau titik
      input += value;
    });
  }

  String _evaluateExpression(String exprRaw) {
    try {
      if (exprRaw.isEmpty) return "";

      // normalisasi simbol
      String expr = exprRaw.replaceAll("x", "*").replaceAll("÷", "/");
      expr = expr.replaceAll("×", "*");

      // tokenisasi karakter-per-karakter (mendukung unary minus)
      List<String> numStrs = [];
      List<String> ops = [];
      String buf = "";

      for (int i = 0; i < expr.length; i++) {
        String c = expr[i];

        if (c == '+' || c == '-' || c == '*' || c == '/') {
          if (buf.isEmpty) {
            // jika buffer kosong dan minus => unary minus (bagian dari angka)
            if (c == '-') {
              buf = "-";
              continue;
            } else {
              // operator lain muncul tanpa angka sebelumnya => ekspresi invalid
              return "Error";
            }
          } else {
            // simpan angka dalam buffer, lalu simpan operator
            numStrs.add(buf);
            ops.add(c);
            buf = "";
          }
        } else {
          // digit atau titik
          buf += c;
        }
      }

      // tambahkan angka terakhir
      if (buf.isNotEmpty) {
        numStrs.add(buf);
      } else {
        // kalau buffer kosong berarti ekspresi berakhiran operator -> invalid
        return "Error";
      }

      // validasi jumlah token
      if (numStrs.length != ops.length + 1) return "Error";

      // parse angka ke double
      List<double> numbers = [];
      for (var s in numStrs) {
        double? v = double.tryParse(s);
        if (v == null) return "Error";
        numbers.add(v);
      }

      // evaluasi kiri -> kanan
      double res = numbers[0];
      for (int i = 0; i < ops.length; i++) {
        String op = ops[i];
        double next = numbers[i + 1];
        if (op == "+") {
          res = res + next;
        } else if (op == "-") {
          res = res - next;
        } else if (op == "*") {
          res = res * next;
        } else if (op == "/") {
          if (next == 0) return "Error: /0";
          res = res / next;
        }
      }

      // formatting hasil: jika integer tampil tanpa .0, else hilangkan trailing zero
      String output;
      if (res == res.toInt()) {
        output = res.toInt().toString();
      } else {
        // format dengan maksimal 6 desimal, lalu hapus trailing zero
        output = res.toStringAsFixed(6).replaceFirst(RegExp(r'\.?0+$'), '');
      }

      // rule: jika panjang hasil melebihi 6 => error
      if (output.length > 6) return "Error: melebihi frame";

      return output;
    } catch (e) {
      return "Error";
    }
  }

  Widget tombol(String text,
      {Color? warna, Color? teksWarna, double tinggi = 70}) {
    return GestureDetector(
      onTap: () => tekanTombol(text),
      child: Container(
        height: tinggi,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: warna ?? Colors.blueGrey[800],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: teksWarna ?? Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Kalkulator", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Display
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      input,
                      style: TextStyle(color:Colors.blueGrey[700], fontSize: 32),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    hasil,
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // Tombol
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: tombol("AC", warna: Colors.blue)),
                    Expanded(child: tombol("⌫", warna: Colors.blue)),
                    Expanded(child: tombol("÷", warna: Colors.blue)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: tombol("7")),
                    Expanded(child: tombol("8")),
                    Expanded(child: tombol("9")),
                    Expanded(child: tombol("x", warna: Colors.blue)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: tombol("4")),
                    Expanded(child: tombol("5")),
                    Expanded(child: tombol("6")),
                    Expanded(child: tombol("-", warna: Colors.blue)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: tombol("1")),
                    Expanded(child: tombol("2")),
                    Expanded(child: tombol("3")),
                    Expanded(child: tombol("+", warna: Colors.blue)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: tombol("0")),
                    Expanded(child: tombol(".", warna: Colors.blueGrey[700])),
                    Expanded(
                        child: tombol("=", warna: Colors.lightBlueAccent)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
