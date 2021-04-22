

import 'package:appeliolucas/model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeEmpresaTela extends StatefulWidget {
  @override
  _HomeEmpresaTelaState createState() => _HomeEmpresaTelaState();
}

class _HomeEmpresaTelaState extends State<HomeEmpresaTela> {
  var txtNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Usuario user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Empresa"),
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
              '${user.login}!',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow,
                  fontStyle: FontStyle.italic),
            ),
             ],),
            Icon(Icons.menu, size: 120, color: Colors.white),
            SizedBox(height: 40),
            ListTile(
              trailing: Icon(Icons.assignment_ind, color: Colors.yellow),
              title: Text('Cadastro funcionário',
                  style: TextStyle(fontSize: 26, color: Colors.yellow)),
              subtitle: Text('Cadastre um novo funcionário em seu estabelecimento ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/cadastrofuncionariotela');
              },
              hoverColor: Colors.yellow,
            ),
            ListTile(
              trailing: Icon(Icons.assignment_turned_in, color: Colors.yellow),
              title: Text('alterar cadastro',
                  style: TextStyle(fontSize: 26, color: Colors.yellow)),
              subtitle: Text('Faz alteração do seu cadastro',
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
            ListTile(
              trailing: Icon(Icons.emoji_people_sharp, color: Colors.yellow),
              title: Text('Limite de pessoas',
                  style: TextStyle(fontSize: 26, color: Colors.yellow)),
              subtitle: Text('Ajuste o limite de pessoas dentro do estabelecimento. ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Atualizar o limite de pessoas',
                            style: TextStyle(fontSize: 12)),
                        content: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          controller: txtNumber,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              hintText: 'Informe o limite de pessoas'),
                        ),
                        actions: [
                          
                          SizedBox(
                            width: 120.0,
                            child: RaisedButton(
                              onPressed: () {
                                txtNumber.clear();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text('Limite de pessoas atualizadas.'),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.yellow,
                                ));
                                Navigator.pop(context);
                              },
                              child: Text(
                                "salvar",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(
                            width: 120.0,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      );
                    });
              },
              hoverColor: Colors.yellow,
            ),
            ListTile(
              trailing: Icon(Icons.assignment_ind, color: Colors.yellow),
              title: Text('Lista de funcionários',
                  style: TextStyle(fontSize: 26, color: Colors.yellow)),
              subtitle: Text('Veja os usuários cadastrados na sua empresa, e realiza alterações em seu perfil ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/listafuncionario');
              },
              hoverColor: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
