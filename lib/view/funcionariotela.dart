import 'package:flutter/material.dart';

class Funcionario extends StatefulWidget {
  @override
  _FuncionarioState createState() => _FuncionarioState();
}

class _FuncionarioState extends State<Funcionario> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
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
                Text("Nome Funcionário", style: TextStyle(fontSize: 22, color: Colors.yellow),),
                Text("Endereço: xxxxx", style: TextStyle(fontSize: 15, color: Colors.yellow),),
                Text("Telefone: xxxxx", style: TextStyle(fontSize: 15, color: Colors.yellow),),
                Text("Celular: xxxxx", style: TextStyle(fontSize: 15, color: Colors.yellow),),
                SizedBox(height: 20),
                
                CheckboxListTile(
                  title: const Text('Ativo'),
                  value: checkBoxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBoxValue = value!;
                    });
                  },
                  secondary:  Icon(Icons.person, color: Colors.black,),
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
