import 'package:appeliolucas/view/homeempresatela.dart';
import 'package:appeliolucas/view/homefuncionariotela.dart';
import 'package:appeliolucas/view/hometela.dart';
import 'package:appeliolucas/view/sobretela.dart';
import 'package:appeliolucas/view/cadastrotela.dart';
import 'package:flutter/material.dart';

import 'model/usuario.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'EL Controller',

    //ROTAS DE NAVEGAÇÃO
    initialRoute: '/primeira',
    routes: {
      '/primeira': (context) => PrimeiraTela(),
      '/home': (context) => HomeTela(),
      '/homeempresa': (context) => HomeEmpresaTela(),
      '/sobre': (context) => SobreTela(),
      '/cadastro': (context) => CadastroTela(),
      '/homefuncionario': (context) => HomeFuncionarioTela(),
    },
    //Tema
    theme: ThemeData(
      primaryColor: Colors.grey[850],
      backgroundColor: Colors.grey[850],
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
  var _formId = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(40),
            child: Form(
              key: _formId,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/imagens/logo1.jpg'),
                  //
                  SizedBox(height: 30),
                  TextField(
                    controller: txtLogin,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline, color: Colors.yellow),
                      labelText: 'Insira o Usuário',
                      labelStyle: TextStyle(color: Colors.yellow),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenha,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline, color: Colors.yellow),
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.yellow),
                     
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states){
                          if(states.contains(MaterialState.pressed))
                          return Colors.yellow[700];
                          return Colors.yellow[600];
                        }, 
                      )),
                      label: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 24),
                      ),
                      icon: Icon(Icons.login),
                      onPressed: () {
                        var user = Usuario(txtLogin.text, txtSenha.text);
                        if (txtLogin.text == "testecliente") {
                          Navigator.pushReplacementNamed(context, '/home',
                              arguments: user);
                        } else if (txtLogin.text == "testeempresa") {
                          Navigator.pushReplacementNamed(
                              context, '/homeempresa',
                              arguments: user);
                        } else if (txtLogin.text == "testefuncionario") {
                          Navigator.pushReplacementNamed(
                              context, '/homefuncionario',
                              arguments: user);
                        }
                      },
                    ),  
                  )

                ],
              ),
            ),
        
          ),

        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed:(){
              Navigator.pushNamed(context, '/cadastro');
          },
          icon: Icon(Icons.add),
          label: Text('Cadastrar'),
          backgroundColor: Colors.yellow,
        ),
        );
  }
}
