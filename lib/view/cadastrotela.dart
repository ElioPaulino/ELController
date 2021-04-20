import 'package:flutter/material.dart';

class CadastroTela extends StatefulWidget {
  @override
  _CadastroTelaState createState() => _CadastroTelaState();
}

class _CadastroTelaState extends State<CadastroTela> {
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
                    color: Theme.of(context).primaryColor,
                    size: 160,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: txtNome,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline),
                      hintText: "Informe o nome",
                    ),
                  ),
                  RadioListTile(
	                  title: Text("Cliente"),
	                  subtitle: Text("Escolha uma opção"),
	                  value: "C",
	                  groupValue: empresapessoa,
	                  onChanged: (String valor){
		                setState((){
                      empresapessoa = valor;
                    });
	                  }
                  ),
                  RadioListTile(
	                  title: Text("Empresa"),
	                  subtitle: Text("Escolha uma opção"),
                    activeColor: Colors.yellow,
	                  value: "E",
	                  groupValue: empresapessoa,
	                  onChanged: (String valor){
		                setState((){
                      empresapessoa = valor;
                    });
	                  }
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtCpfCnpj,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      labelText: 'Informe Cpf ou Cnpj',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtTelefone,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      labelText: 'Informe o telefone',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtCelular,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      labelText: 'Informe o celular',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtLogin,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      labelText: 'Informe o login',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenha,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      labelText: 'Informe a senha',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenhaConf,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      labelText: 'Informe a senha novamente',
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