import 'package:flutter/material.dart';

class SobreTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Icons.text_snippet_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 160,
                ),
                SizedBox(height: 20),
                Text("Tema escolhido:"),
                SizedBox(height: 30),
                Text("Objetivo do aplicativo:"),
                SizedBox(height: 20),
                
                
              ],
            ),
          ),
        ));
  }
}
