import 'package:appeliolucas/model/funcionario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';



class ListaFuncionario extends StatefulWidget {

  final String uid;
  ListaFuncionario({required this.uid});
  @override
  _ListaFuncionarioState createState() => _ListaFuncionarioState();
}

class _ListaFuncionarioState extends State<ListaFuncionario> {
  late CollectionReference funcionarios;

  @override
  void initState() {
    super.initState();
    funcionarios = FirebaseFirestore.instance.collection('funcionarios');
  }

  Widget itemLista(item) {
    Funcionario funcionario = Funcionario.fromJson(item.data(), item.id);
    return ListTile(
                  leading: Icon(Icons.label, color: Colors.yellow),
                  title: Text(funcionario.nome,
                      style: TextStyle(fontSize: 20, color: Colors.yellow)),
                  subtitle: Text(funcionario.cargo,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                  onTap: () {
                    print('item pressionado');
                    Navigator.pushNamed(context, '/funcionario', arguments: item.id);
                  },
                  //hoverColor: Colors.blue[100],
                );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Funcionarios"),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,

              //Exibir os documentos
      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: funcionarios.snapshots(),

          //aparência
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text('Erro ao conectar no Firebase'));

              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              default:
                final dados = snapshot.requireData;

                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return itemLista(dados.docs[index]);
                    }
                );
            }
          }),
        );
  }
}