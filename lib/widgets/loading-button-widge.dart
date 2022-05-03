import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  LoadingButton(
      {Key? key,
      required this.busy,
      required this.invert,
      required this.text,
      required this.backgroundColor,
      required this.colorText,
      required this.onPressed})
      : super(key: key);

  var busy = false;
  var invert = false;
  var text = "";
  // ignore: prefer_typing_uninitialized_variables
  var backgroundColor;
  // ignore: prefer_typing_uninitialized_variables
  var colorText;

  VoidCallback
      onPressed; // Criando uma variavel do tipo VoidCallback, que recebe uma função do tipo void

  @override
  Widget build(BuildContext context) {
    // Criando o Widget
    return busy // Operação ternária no return para validar se devolve um estilo de widget botão ou o loading icon
        ? Container(
            // Se busy for true retorna um container
            alignment: Alignment.center, // Alinamento ao centro
            margin:
                const EdgeInsets.all(25), // Margin de 25 para todos os lados
            height: 60, // Altura de 60 (container)
            child: const CircularProgressIndicator(
                // Definindo o filho como um CircularProcessIndicator (Icone de loadin)
                backgroundColor: Colors.white),
          )
        : Container(
            // Se busy for false retorna um container
            margin:
                const EdgeInsets.all(30), // Margin de 30 para todos os lados
            width: double
                .infinity, // Largura infinita (cobrindo a largura total do container)
            child: SizedBox(
              // Criando o filho como um SizeBox (caixa)
              height: 60, // Altura de 60
              child: TextButton(
                // Filho do Sizebox
                child: Text(
                  // Texto
                  text,
                  style: TextStyle(
                      // Estilo do texto
                      color:
                          invert ? colorText : Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontFamily: "Big Shoulders Display"),
                ),
                style: TextButton.styleFrom(
                  // Criando o botão (TextButton)
                  backgroundColor: invert
                      ? backgroundColor
                      : Colors
                          .white, // Definindo a cor do botão com base de uma váriavel (definindo através de uma operação ternaria)
                  shape: RoundedRectangleBorder(
                    // Dedfinindo o shape do botão com RoundedRectangle
                    borderRadius: BorderRadius.circular(
                        60), // Definindo border radius sobre o shape escolhido acima
                  ),
                ),
                onPressed:
                    onPressed, // Definindo função que vai ser executada ao ser pressionado (recebido pelo construtor)
              ),
            ),
          );
  }
}
