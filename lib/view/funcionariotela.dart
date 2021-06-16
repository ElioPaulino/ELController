import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Funcionario extends StatefulWidget {
  @override
  _FuncionarioState createState() => _FuncionarioState();
}

class _FuncionarioState extends State<Funcionario> {
  var txtAtivo = TextEditingController();
  var txtCargo = TextEditingController();
  var txtCelular = TextEditingController();
  var txtcpfCnpj = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtNome = TextEditingController();
  var txtTelefone = TextEditingController();

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;
    Funcionario? funcionario;
    FirebaseFirestore.instance
        .collection('funcionarios')
        .doc(id.toString())
        .get()
        .then((value) {
      txtAtivo.text = value.data()!['ativo'].toString();
      txtCargo.text = value.data()!['cargo'].toString();
      txtCelular.text = value.data()!['celular'].toString();
      txtcpfCnpj.text = value.data()!['cpfCnpj'].toString();
      txtEndereco.text = value.data()!['endereco'].toString();
      txtNome.text = value.data()!['nome'].toString();
      txtTelefone.text = value.data()!['telefone'].toString();
    });
    txtAtivo.text == "true" ? checkBoxValue = true : checkBoxValue = false;

    return Scaffold(
        appBar: AppBar(
          title: Text("Funcionario"),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nome Funcionário: " + txtNome.text,
                  style: TextStyle(fontSize: 22, color: Colors.yellow),
                ),
                Text(
                  "Endereço: " + txtEndereco.text,
                  style: TextStyle(fontSize: 15, color: Colors.yellow),
                ),
                Text(
                  "Telefone: " + txtTelefone.text,
                  style: TextStyle(fontSize: 15, color: Colors.yellow),
                ),
                Text(
                  "Celular: " + txtCelular.text,
                  style: TextStyle(fontSize: 15, color: Colors.yellow),
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  title: const Text('Ativo'),
                  value: checkBoxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBoxValue = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  checkColor: Colors.yellow,
                  tileColor: Colors.yellow,
                  activeColor: Colors.black,
                ),
              ],
            ),
          ),
        ));
  }
}
