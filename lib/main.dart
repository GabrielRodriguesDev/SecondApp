import 'package:aog/pages/home.page.dart';
import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button-widge.dart';
import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit-form.dart';
import 'package:aog/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(
      const MyApp()); //Setando a classe que vai ser carregada ao iniciar o app
}

class MyApp extends StatelessWidget {
  // Criando uma tela inicial sem estado => Classe que é usada ao iniciar o app
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Retornando uma MaterialApp (Tema)
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false, //Desativando o banner de debug
      theme: ThemeData(primarySwatch: Colors.indigo), //Definindo a cor do tema
      home:
          HomePage(), //Definindo a home (Classe ou Wiget) que vai ser carregado ao chamar dar esse retorno
    );
  }
}
