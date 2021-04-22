import 'package:flutter/material.dart';

class ListaFuncionario extends StatefulWidget {
  @override
  _ListaFuncionarioState createState() => _ListaFuncionarioState();
}

class _ListaFuncionarioState extends State<ListaFuncionario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Funcionarios"),
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
                ListTile(
                  leading: Icon(Icons.label, color: Colors.yellow),
                  title: Text('Nome funcionário',
                      style: TextStyle(fontSize: 20, color: Colors.yellow)),
                  subtitle: Text('Cargo: xxxxxxxxxxxxxxxxxxxxx.',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                  onTap: () {
                    print('item pressionado');
                    Navigator.pushNamed(context, '/funcionario');
                  },
                  //hoverColor: Colors.blue[100],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}