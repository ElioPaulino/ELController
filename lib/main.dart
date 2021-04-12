import 'package:flutter/material.dart';

import 'model/usuario.dart';
import 'model/view/hometela.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'App Fila Virtual',

    //ROTAS DE NAVEGAÇÃO
    initialRoute: '/primeira',
    routes: {
      '/primeira': (context) => PrimeiraTela(),
      '/home': (context) => HomeTela(),
    },
    //Tema
    theme: ThemeData(
      primaryColor: Colors.blue[500],
      backgroundColor: Colors.white,
      fontFamily: 'Roboto', //Raleway
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 30),
      ),
    ),
  ));
}

class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.supervised_user_circle,
                  color: Theme.of(context).primaryColor,
                  size: 160,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: txtLogin,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person_outline),
                    hintText: "Insira o usuário",
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: txtSenha,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock_outline),
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton.icon(
                    label: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(Icons.login),
                    onPressed: () {
                      var user = Usuario(txtLogin.text, txtSenha.text);
                      if (txtLogin.text == "teste") {
                        Navigator.pushNamed(context, '/home', arguments: user);
                      }
                    },
                  ),
                )
                
              ],
            ),
          ),
        ));
  }
}

