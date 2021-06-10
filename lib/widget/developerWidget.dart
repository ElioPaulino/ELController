import 'package:flutter/material.dart';

class DeveloperWidget extends StatelessWidget {
  final String nome;
  final String foto;

  DeveloperWidget(this.nome, this.foto); //Construtor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //Largura que tem disponivel
      //height: 200,
      margin:
          EdgeInsets.all(20), //Definiu uma distancia de 20 px em todos os lados
      //symmetric(horizontal: 20)
      //symmetric(vertical: 20)
      //only(left: 20)
      //fromLTRB(10,20,30,40)
      //ESPAÇAMENTO
      padding: EdgeInsets.all(20), // é o espaço interno que ele espaça
      //BORDA
      decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.yellow.shade400, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              colors: [Colors.yellow.shade400, Colors.white, Colors.yellow.shade400],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        children: [
          Text(
            nome,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(foto)
        ],
      ),
    );
  }
}
