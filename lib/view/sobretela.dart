import 'package:appeliolucas/widget/developerWidget.dart';
import 'package:flutter/material.dart';

class SobreTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sobre"),
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
                  title: Text('Tema escolhido',
                      style: TextStyle(fontSize: 20, color: Colors.yellow)),
                  subtitle: Text(
                      'O tema escolhido foi realizar um aplicativo que faça o controle de acesso de pessoas dentro de estabelecimentos, tais como, shopping, mercados e padarias. O aplicativo EL controller terá duas visoes. A primeira visão sera a dos estabeleciomentos onde podera realizar a leitura de QrCodes, ver a quantidade de pessoas dentro do estabelecimento e  cadastrar funcionarios. A segunda visão sera a do cliente onde podera agendar um horario para ir ao estabelecimento. ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                  onTap: () {
                    print('item pressionado');
                    Navigator.pushNamed(context, '/list1');
                  },
                  //hoverColor: Colors.blue[100],
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.label, color: Colors.yellow),
                  title: Text('Objetivo do aplicativo',
                      style: TextStyle(fontSize: 20, color: Colors.yellow)),
                  subtitle: Text(
                      'O objetivo do EL Controller é auxiliar e solucionar problemas de lotação máxima de locais como supermercado, padarias, shoppings e outros lugares. Por conta da pandemia causada pela Covid-19, os lugares tem que ter um controle maior em relação a quantidade de pessoas que esta dentro do estabelecimento, proporcionando assim, uma melhor qualidade no serviço e segurança tanto para os funcionario quanto para os clientes do estabelecimento. ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                  onTap: () {},
                  // hoverColor: Colors.blue[100],
                ),
                SizedBox(height: 20),
                Text("Desenvolvedores",
                    style: TextStyle(color: Colors.yellow, fontSize: 27)),
                DeveloperWidget(
                    "Elio Antonio Paulino Junior", "lib/imagens/Elio.jpg"),
                SizedBox(height: 20),
                DeveloperWidget(
                    "Lucas da Cunha Alves", "lib/imagens/Lucas.jpeg"),
              ],
            ),
          ),
        ));
  }
}
