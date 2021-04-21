import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GerarQrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gerar QrCode"),
          centerTitle: true,
        ),
        backgroundColor: Colors.yellow,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QrImage(
                  data: "1234567890",
                  size: 300.0,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('O QrCode gerado com sucesso'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.black,
            ));
          },
          icon: Icon(Icons.add),
          label: Text('Gera um novo QRcode'),
          backgroundColor: Colors.black,
        ));
  }
}
