import 'package:appeliolucas/model/usuario.dart';
import 'package:flutter/material.dart';

class HomeTela extends StatefulWidget {
  @override
  _HomeTelaState createState() => _HomeTelaState();
}

class _HomeTelaState extends State<HomeTela> {
  @override
  Widget build(BuildContext context) {
    Usuario user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
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
            Row(
              children: [
                Text(
                  'Bem vindo ',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${user.login}!',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.yellow,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Icon(Icons.menu, size: 120, color: Colors.white),
            SizedBox(height: 40),
            ListTile(
              trailing: Icon(Icons.qr_code, color: Colors.yellow),
              title: Text('Gerar QrCode',
                  style: TextStyle(fontSize: 26, color: Colors.yellow)),
              subtitle: Text(
                  'Gerar um QrCode para pode entrar no estabelecimento.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/gerarqrcodetela');
              },
              hoverColor: Colors.yellow,
            ),
            SizedBox(height: 40),
            ListTile(
              trailing: Icon(Icons.store, color: Colors.yellow),
              title: Text('Estabelecimentos que esteve',
                  style: TextStyle(fontSize: 26, color: Colors.yellow)),
              subtitle: Text('Ver lista de estabelecimentos onde esteve.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/historicovisita');
              },
              hoverColor: Colors.yellow,
            ),
            SizedBox(height: 40),
            ListTile(
              trailing: Icon(Icons.qr_code, color: Colors.yellow),
              title: Text('Alterar cadastro',
                  style: TextStyle(fontSize: 26, color: Colors.yellow)),
              subtitle: Text('Alterar dados do cadastro.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/alterarcadastro');
              },
              hoverColor: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
