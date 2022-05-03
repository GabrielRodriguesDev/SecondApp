import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'input.widget.dart';
import 'loading-button-widge.dart';

class SubmitForm extends StatelessWidget {
  //Criando a classe sem estado
  SubmitForm(
      {Key? key,
      required this.gasCtrl,
      required this.alcCtrl,
      required this.busy,
      required this.submitForm})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var gasCtrl; //Criando variavel que virá a receber os controladores através do construtor
  // ignore: prefer_typing_uninitialized_variables
  var alcCtrl; //Criando variavel que virá a receber os controladores através do construtor
  var busy =
      false; //Variavel que controla o estado do icone de loading que será fornecida por outra classe através do construtor
  VoidCallback
      submitForm; // Criando uma variavel do tipo VoidCallback, que recebe uma função do tipo void

  @override
  Widget build(BuildContext context) {
    //Criando Widget
    return Column(
      // Retornando uma coluna
      children: <Widget>[
        // Definindo os filhos da coluna
        Padding(
          //Criando um preechimento de 30 para esquerda e direita (prechimento para simular um espaçamento)
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Input(
            // Criando o filho desse espaçamento que será um Widget criado do tipo Input
            label: "Gasolina", // Definindo o texto informativo do label
            ctrl:
                gasCtrl, // Passando o controlador que foi passado na construção dessa classe
          ),
        ),
        Padding(
          //Repetindo as linhas acima para outro input, portanto a diferença é apenas o controlador, lembrando que é um Widget que foi construido em outra classe
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Álcool",
            ctrl: alcCtrl,
          ),
        ),
        LoadingButton(
          // Definindo o widget de loading button e passando algumas informações na construção da classe desse widget
          busy: busy, // Controlador do icone loading
          invert: false, // Controlador de inversão de cor
          text: "Calcular", // Texto a ser exibido
          backgroundColor: Colors.white, // Cor de fundo do botão
          colorText: Theme.of(context).primaryColor, // Cor do texto do botão
          onPressed: submitForm, //Função a ser executada ao cliclarmos no botão
        )
      ],
    );
  }
}
