import 'package:appeliolucas/model/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeFuncionarioTela extends StatefulWidget {
  @override
  _HomeFuncionarioTelaState createState() => _HomeFuncionarioTelaState();
}

class _HomeFuncionarioTelaState extends State<HomeFuncionarioTela> {

   var txtNome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

      FirebaseFirestore.instance.collection('Funcionario')
      .doc(id.toString()).get().then((value) {
        txtNome.text = value.data()!['nome'].toString();
      }
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Funcionário"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('lib/imagens/logo1.jpg'),
              decoration: BoxDecoration(
                color: Colors.grey[850],
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.assignment,
                color: Colors.black,
                size: 30,
              ),
              title: Text('Sobre'),
              onTap: () {
                Navigator.pushNamed(context, '/sobre');
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Sair',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/primeira');
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        color: Colors.grey[850],
        //
        // LISTVIEW
        //
        child: ListView(
          children: [
            Row(children: [
            Text(
              'Bem vindo ',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,),
            ),
            Text(
              txtNome.text,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow,
                  fontStyle: FontStyle.italic),
            ),

            ],),

            Icon(Icons.menu, size: 120, color: Colors.white),
            SizedBox(height: 40),
            ListTile(
              trailing: Icon(Icons.qr_code, color: Colors.yellow),
              title: Text('Ler QrCode',
                  style: TextStyle(fontSize: 26, color: Colors.yellow)),
              subtitle: Text(
                  'Ler QrCode para pode entrar no estabelecimento.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                Navigator.pushNamed(context, '/lerqrcodetela');
              },
              hoverColor: Colors.yellow,
            ),
            SizedBox(height: 40),
            Padding(padding: EdgeInsets.all(16.0),
              child: Text("Número de pessoas no estabelecimento: x", style: TextStyle(color: Colors.yellow, fontSize: 26),),
            ),
          ],
        ),
      ),
    );
  }
}