import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class UpdateData extends StatefulWidget {
  final List list;
  final int index;

  UpdateData({this.list, this.index});

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController controllerKode;
  TextEditingController controllerNama;
  TextEditingController controllerHarga;
  TextEditingController controllerStok;

  void UpdateData() {
    var url = "http://192.168.10.37/tokocrud/updatedata.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "kode": controllerKode.text,
      "nama": controllerNama.text,
      "harga": controllerHarga.text,
      "stok": controllerStok.text,
    });
  }

  @override
  initState() {
    controllerKode =
        TextEditingController(text: widget.list[widget.index]['kode']);
    controllerNama =
        TextEditingController(text: widget.list[widget.index]['nama']);
    controllerHarga =
        TextEditingController(text: widget.list[widget.index]['harga']);
    controllerStok = TextEditingController(
        text: widget.list[widget.index]
            ['stok']); //mengisi controler dengan list index
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPDATE DATA"),
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
                    "Update Data",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    UpdateData();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SearchListView())); //untuk kembali ke laman awal
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
