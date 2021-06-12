import 'package:appeliolucas/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroTela extends StatefulWidget {
  @override
  _CadastroTelaState createState() => _CadastroTelaState();
}

class _CadastroTelaState extends State<CadastroTela> {
  var txtNome = TextEditingController();
  var txtCpfCnpj = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCelular = TextEditingController();
  var txtEstado = TextEditingController();
  var txtBairro = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();
  var txtSenhaConf = TextEditingController();
  var _formId = GlobalKey<FormState>();
  late String empresapessoa = "";
  //Recuperar um documento a partir do ID
  getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('clientes')
        .doc(id)
        .get()
        .then((value) {
      txtNome.text = value.data()!['nome'].toString();
      txtCpfCnpj.text = value.data()!['cpfCnpj'].toString();
      txtTelefone.text = value.data()!['telefone'].toString();
      txtCelular.text = value.data()!['celular'].toString();
      txtEstado.text = value.data()!['estado'].toString();
      txtBairro.text = value.data()!['bairro'].toString();
      txtEndereco.text = value.data()!['endereco'].toString();
      txtLogin.text = value.data()!['login'].toString();
      txtSenha.text = value.data()!['senha'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    //Recuperar o ID que foi passado como argumento
    var id = ModalRoute.of(context)?.settings.arguments;
    Cliente? cliente;
    if (id != null) {
      cliente = getDocumentById(id.toString());
      txtNome.text = cliente!.nome;
      txtCpfCnpj.text = cliente.cpfCnpj;
      txtTelefone.text = cliente.telefone;
      txtCelular.text = cliente.celular;
      txtEstado.text = cliente.estado;
      txtBairro.text = cliente.bairro;
      txtEndereco.text = cliente.endereco;
      txtLogin.text = cliente.login;
      txtSenha.text = cliente.senha;
    }

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
                  Icon(
                    Icons.assignment,
                    color: Colors.yellow,
                    size: 160,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: txtNome,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: "Informe o nome",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  RadioListTile(
                      title: Text("Cliente",
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text("Escolha se quer cadastrar uma pessoa",
                          style: TextStyle(color: Colors.white)),
                      activeColor: Colors.yellow,
                      value: "C",
                      groupValue: empresapessoa,
                      onChanged: (String? valor) {
                        setState(() {
                          empresapessoa = valor.toString();
                          print(valor.toString());
                        });
                      }),
                  RadioListTile(
                      title: Text("Empresa",
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text("Escolha se quer cadastrar uma empresa",
                          style: TextStyle(color: Colors.white)),
                      activeColor: Colors.yellow,
                      value: "E",
                      groupValue: empresapessoa,
                      onChanged: (String? valor) {
                        setState(() {
                          empresapessoa = valor.toString();
                        });
                      }),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtCpfCnpj,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        labelText: 'Informe Cpf ou Cnpj',
                        labelStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtTelefone,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o telefone',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtCelular,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o celular',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: txtEstado,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o estado',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: txtBairro,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o bairro',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: txtEndereco,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o endereço',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtLogin,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o login',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenha,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe a senha',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenhaConf,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe a senha novamente',
                      labelStyle: TextStyle(color: Colors.white),
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
                            return Colors.yellow;
                          return Colors.yellow;
                        },
                      )),
                      label: Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 24),
                      ),
                      icon: Icon(Icons.app_registration),
                      onPressed: () {
                        criarConta(txtNome.text, txtLogin.text, txtSenha.text);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {
    FirebaseAuth fa = FirebaseAuth.instance;

    fa
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      //armazenar dados da conta no Firestore
      var db = FirebaseFirestore.instance;
      db.collection('usuarios').doc(resultado.user!.uid).set({
        'nome': nome,
        'email': email,
      }).then((valor) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Usuário criado com sucesso.'),
          duration: Duration(seconds: 2),
        ));
        Navigator.pop(context);
      });
    }).catchError((erro) {
      var errorCode = erro.code;
      //print(errorCode);

      if (errorCode == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ERRO: O email informado já está em uso.'),
          duration: Duration(seconds: 2),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ERRO ${erro.message}'),
          duration: Duration(seconds: 2),
        ));
      }
    });
  }
}
