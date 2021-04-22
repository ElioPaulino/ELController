import 'package:flutter/material.dart';

class AlterarCadastroTela extends StatefulWidget {
  @override
  _AlterarCadastroTelaState createState() => _AlterarCadastroTelaState();
}

class _AlterarCadastroTelaState extends State<AlterarCadastroTela> {
  var txtNome = TextEditingController();
  var txtCpfCnpj = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCelular = TextEditingController();
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();
  var txtSenhaConf = TextEditingController();
  var _formId = GlobalKey<FormState>();
  String empresapessoa;
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
                            return Colors.yellow[700];
                          return Colors.yellow[600];
                        },
                      )),
                      label: Text(
                        'Alterar',
                        style: TextStyle(fontSize: 24),
                      ),
                      icon: Icon(Icons.app_registration),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Cadastro relizado com sucesso!!!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.yellow,
                        ));
                        Navigator.pop(context);

                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
