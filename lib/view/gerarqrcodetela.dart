import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class GerarQrCode extends StatelessWidget {
  var txtQrCode = "Por favor gere o QrCode";
  var nomeCliente = "";
  var data = "";
  @override
  Widget build(BuildContext context) {
    //Recuperar o ID que foi passado como argumento
    var id = ModalRoute.of(context)?.settings.arguments;
    
    
      FirebaseFirestore.instance.collection('Clientes')
      .doc(id.toString()).get().then((value) {
        nomeCliente = value.data()!['nome'].toString();
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
          txtQrCode = "";
          txtQrCode = gerarNumero();
          data = gerardata();
            var db = FirebaseFirestore.instance;
                        db.collection('presenca').add({
                          "nome": nomeCliente,
                          "qrCode": txtQrCode,
                          "estabelecimento" : " ",
                          "data": data
                        });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('O QrCode gerado com sucesso  $txtQrCode'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.black,
            ));
            txtQrCode = "Por favor gere o QrCode";
          },
          icon: Icon(Icons.add),
          label: Text('Gera o QRcode'),
          backgroundColor: Colors.black,
        ));
  }


  String gerarNumero(){
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    return randomNumber.toString();
  }

  String gerardata(){
    var date = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute, DateTime.now().second, DateTime.now().microsecond);
     return date.toString();
  }

}
