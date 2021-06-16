import 'package:appeliolucas/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlterarCadastroTela extends StatefulWidget {
  @override
  _AlterarCadastroTelaState createState() => _AlterarCadastroTelaState();
}

class _AlterarCadastroTelaState extends State<AlterarCadastroTela> {
  var txtNome = TextEditingController();
  var txtCpfCnpj = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCelular = TextEditingController();
  var txtBairro = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtEstado = TextEditingController();
  //Recuperar um documento a partir do ID

  @override
  Widget build(BuildContext context) {
    //Recuperar o ID que foi passado como argumento
    var id = ModalRoute.of(context)?.settings.arguments;

    Cliente? cliente;
    FirebaseFirestore.instance
        .collection('Clientes')
        .doc(id.toString())
        .get()
        .then((value) {
      txtNome.text = value.data()!['nome'].toString();
      txtCpfCnpj.text = value.data()!['cpfCnpj'].toString();
      txtTelefone.text = value.data()!['telefone'].toString();
      txtCelular.text = value.data()!['celular'].toString();
      txtBairro.text = value.data()!['bairro'].toString();
      txtEndereco.text = value.data()!['endereco'].toString();
      txtEstado.text = value.data()!['estado'].toString();
    });

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
                  controller: txtBairro,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
                    labelText: 'Informe o bairro',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 30),
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
                  controller: txtEstado,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
                    labelText: 'Informe o estado',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                 
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
                      'Alterar',
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(Icons.app_registration),
                    onPressed: () {
                      var db = FirebaseFirestore.instance;
                      
                        //Atualizar um documento
                        db.collection('Clientes')
                            .doc(id.toString())
                            .update({
                            'nome': txtNome.text,
                            'cpfCnpj': txtCpfCnpj.text,
                            'telefone': txtTelefone.text,
                            'celular': txtCelular.text,
                            'estado': txtEstado.text,
                            'bairro': txtBairro.text,
                            'endereco':txtEndereco.text
                            }
                            );
                      

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Cadastro alterado com sucesso!!!'),
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
        ));
  }
}
