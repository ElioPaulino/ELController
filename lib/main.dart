import 'package:appeliolucas/model/cliente.dart';
import 'package:appeliolucas/view/alterarcadastrotela.dart';
import 'package:appeliolucas/view/cadastrofuncionariotela.dart';
import 'package:appeliolucas/view/funcionariotela.dart';
import 'package:appeliolucas/view/historicovisitatela.dart';
import 'package:appeliolucas/view/homeempresatela.dart';
import 'package:appeliolucas/view/homefuncionariotela.dart';
import 'package:appeliolucas/view/hometela.dart';
import 'package:appeliolucas/view/listafuncionariotela.dart';
import 'package:appeliolucas/view/sobretela.dart';
import 'package:appeliolucas/view/cadastrotela.dart';
import 'package:appeliolucas/view/gerarqrcodetela.dart';
import 'package:appeliolucas/view/lerqrcodetela.dart';
import 'package:appeliolucas/view/listaPessoas.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      '/gerarqrcodetela': (context) => GerarQrCode(),
      '/lerqrcodetela': (context) => LerQrCode(),
      '/listapessoas': (context) => ListaPessoas(),
      '/cadastrofuncionariotela': (context) => CadastroFuncionarioTela(),
      '/alterarcadastro': (context) => AlterarCadastroTela(),
      '/historicovisita': (context) => HistoricoVisitaTela(),
      '/listafuncionario': (context) => ListaFuncionario(uid: ''),
      '/funcionario': (context) => Funcionario(),
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
  var db = FirebaseFirestore.instance;

  /*db.collection('cafes').add({"nome": "Café Melita 500g", "preco": "R\$ 9,85"});*/
}

class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();
  var _formId = GlobalKey<FormState>();
  bool isLoading = false;
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
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
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
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
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
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.yellow.shade700;
                        return Colors.yellow.shade600;
                      },
                    )),
                    label: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(Icons.login),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      login(txtLogin.text, txtSenha.text);
                      /*var user = Usuario(txtLogin.text, txtSenha.text);
                      if (txtLogin.text == "testecliente") {
                        if (txtSenha.text == "123") {
                          Navigator.pushReplacementNamed(context, '/home',
                              arguments: user);
                        }
                      } else if (txtLogin.text == "testeempresa") {
                        if (txtSenha.text == "123") {
                          Navigator.pushReplacementNamed(
                              context, '/homeempresa',
                              arguments: user);
                        }
                      } else if (txtLogin.text == "testefunc") {
                        if (txtSenha.text == "123") {
                          Navigator.pushReplacementNamed(
                              context, '/homefuncionario',
                              arguments: user);
                        }
                      }*/
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
        icon: Icon(Icons.add),
        label: Text('Cadastrar'),
        backgroundColor: Colors.yellow,
      ),
    );
  }

  //
  // LOGIN com Firebase Auth
  //
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      var isLoading = false;
      FirebaseFirestore.instance
          .collection('Clientes')
          .doc(resultado.user!.uid)
          .get()
          .then((value) {
        if (value.data()!['nome'].toString().isNotEmpty) {
          Navigator.pushReplacementNamed(context, '/home',
                              arguments: resultado.user!.uid);
        }
      });
      FirebaseFirestore.instance
          .collection('Empresas')
          .doc(resultado.user!.uid)
          .get()
          .then((value) {
        if (value.data()!['nome'].toString().isNotEmpty) {
          Navigator.pushReplacementNamed(context, '/homeempresa',
                              arguments: resultado.user!.uid);
        }
      });
      FirebaseFirestore.instance
          .collection('Funcionario')
          .doc(resultado.user!.uid)
          .get()
          .then((value) {
        if (value.data()!['nome'].toString().isNotEmpty) {
          Navigator.pushReplacementNamed(context, '/homefuncionario',
                              arguments: resultado.user!.uid);
        }
      });
    }).catchError((erro) {
      var errorCode = erro.code;
      var mensagem = '';
      if (errorCode == 'user-not-found') {
        mensagem = 'Usuário não encontrado';
      } else if (errorCode == 'wrong-password') {
        mensagem = 'Senha inválida';
      } else if (errorCode == 'invalid-email') {
        mensagem = 'Email inválido';
      } else {
        mensagem = erro.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('ERRO: $mensagem'),
        duration: Duration(seconds: 2),
      ));
    });
  }
}
