import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  //Criando um Widget sem estado
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Criando o Widget
    return Column(
      // Retornando uma coluna
      children: <Widget>[
        //Criando os filhos presente na coluna
        const SizedBox(
          // Criando um SizedBox (Caixa) (isso para fazer espaçamento)
          height: 100, // Altura de 100
        ),
        Image.asset(
          // Abaixo da "caixa" colocamos uma imagem com 90 de altura
          "assets/images/aog-white.png",
          height: 90,
        ),
        const SizedBox(
          // Criando uma nova caixa abaixo da imagem com 20 de altura (isso para fazer espaçamento)
          height: 20,
        ),
        const Text(
            "Álcool ou Gasolina", // Definindo um texto abaixo da caixa (espaçamento)
            style: TextStyle(
                // Estilizando o texto
                color: Colors.white,
                fontSize: 25,
                fontFamily: "Big Shoulders Display"),
            textAlign: TextAlign.center),
        const SizedBox(
          // Criando mais uma caixa com 20 de altura para gerar o espaçamento.
          height: 20,
        )
      ],
    );
  }
}
