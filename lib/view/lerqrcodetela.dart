import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class LerQrCode extends StatefulWidget {
  @override
  _HomeLerQrCode createState() => _HomeLerQrCode();
}

class _HomeLerQrCode extends State<LerQrCode> {
  String barcode = "";

  Future<void> scanBarcode() async {
    final barcodeResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "cancelar", true, ScanMode.QR);

    setState(() {
      barcode = barcodeResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ler QrCode"),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: [Image.asset('lib/imagens/logo1.jpg')]),
              Row(
                children: [
                  Text(
                    'O numero do QrCode lido é: ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '$barcode',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.yellow,
                    ),
       
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            scanBarcode();
          },
          label: Text("Scan"),
          icon: Icon(Icons.qr_code_scanner),
          backgroundColor: Colors.yellow,
        ));
  }
}
