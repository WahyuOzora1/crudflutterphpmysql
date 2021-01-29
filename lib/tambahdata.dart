import 'package:crudflutterphpmysql/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController controllerKode = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerStok = TextEditingController();

  void tambahData() {
    var url = "http://192.168.10.37/tokocrud/tambahdata.php";

    http.post(url, body: {
      "kode": controllerKode.text,
      "nama": controllerNama.text,
      "harga": controllerHarga.text,
      "stok": controllerStok.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerKode,
                  decoration: InputDecoration(
                    hintText: "Kode Barang",
                    labelText: "Kode Barang",
                  ),
                ),
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    hintText: "Nama Barang",
                    labelText: "Nama Barang",
                  ),
                ),
                TextField(
                  controller: controllerHarga,
                  decoration: InputDecoration(
                    hintText: "Harga Barang",
                    labelText: "Harga Barang",
                  ),
                ),
                TextField(
                  controller: controllerStok,
                  decoration: InputDecoration(
                    hintText: "Stok Barang",
                    labelText: "Stok Barang",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                RaisedButton(
                  child: Text(
                    "Tambah Data",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    tambahData();
                    //untuk kembali ke laman awal
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SearchListView()));
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
