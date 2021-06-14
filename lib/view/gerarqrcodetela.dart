import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class GerarQrCode extends StatelessWidget {
  var txtQrCode = null;
  var nomeCliente = null;
  @override
  Widget build(BuildContext context) {
    //Recuperar o ID que foi passado como argumento
    var id = ModalRoute.of(context)?.settings.arguments;
    
    
      FirebaseFirestore.instance.collection('Clientes')
      .doc(id.toString()).get().then((value) {
        nomeCliente.text = value.data()!['nome'].toString();
      }
    );
    
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
                  data: txtQrCode,
                  size: 300.0,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            
          txtQrCode = gerarNumero();

            var db = FirebaseFirestore.instance;
                        db.collection('presenca').add({
                          "nome": nomeCliente,
                          "qrCode": txtQrCode,
                          "estabelecimento" : txtQrCode,
                          "data": txtQrCode
                        });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('O QrCode gerado com sucesso  $txtQrCode'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.black,
            ));
          },
          icon: Icon(Icons.add),
          label: Text('Gera um novo QRcode'),
          backgroundColor: Colors.black,
        ));
  }


  String gerarNumero(){
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    return randomNumber.toString();
  }
}
