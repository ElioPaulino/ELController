import 'package:appeliolucas/model/usuario.dart';
import 'package:flutter/material.dart';

class HomeEmpresaTela extends StatefulWidget {
  @override
  _HomeEmpresaTelaState createState() => _HomeEmpresaTelaState();
}

class _HomeEmpresaTelaState extends State<HomeEmpresaTela> {
  @override
  Widget build(BuildContext context) {
    Usuario user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Empresa"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
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

        //
        // LISTVIEW
        //
        child: ListView(
          children: [
            Text(
              'Bem vindo ${user.login}!',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontStyle: FontStyle.italic),
            ),
            Icon(Icons.menu, size: 120, color: Colors.grey),
            SizedBox(height: 40),
            ListTile(
              trailing: Icon(Icons.build, color: Colors.grey),
              title: Text('Configuração',
                  style: TextStyle(fontSize: 26, color: Colors.grey)),
              subtitle: Text('Configure o seu perfil. ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/list1');
              },
              hoverColor: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
  }
}
