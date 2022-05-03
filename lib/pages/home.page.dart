import 'package:aog/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../widgets/logo.widget.dart';
import '../widgets/submit-form.dart';

class HomePage extends StatefulWidget {
  // Criando uma classe com estado
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() =>
      _HomePageState(); //Criando o estado da classe
}

class _HomePageState extends State<HomePage> {
  //Moldando o estado que é criando no método anterior.

  Color _color = Colors.indigo;

  var _gasCtrl =
      MoneyMaskedTextController(); //Definindo controller para manipular o input text

  var _alcCtrl =
      MoneyMaskedTextController(); //Definindo controller para manipular o input text

  var _busy =
      false; //Variavel que vamos usar para controlar o estado do loading do botão

  var _completed =
      false; // Variavel que vamos usar para controlar o estado da tela, se foi calculado ou não

  var _resultText =
      "Compensa utilizar álcool"; // Variavel qe vamos usar para armazenar o texto que é exibido após o _completed ser true

  @override
  Widget build(BuildContext context) {
    // Criando o Widget
    return Scaffold(
        // Retornando um Scaffold que é uma implementação de uma tela de estrutura basica do MaterialApp, tendo acesso a appbar floating button.
        backgroundColor:
            Theme.of(context).primaryColor, //Definindo a cor de fundo da tela
        body: AnimatedContainer(
          // Iniciando o corpo (recheio da tela) com um container de animação que permite uma animação sobre os filhos de forma automatica com base nas alterações e a duração é sobre uma curva de tempo que informamos.
          duration: const Duration(
            //Definindo a duração da animação que vai rolar sobre esse container.
            milliseconds: 1200,
          ),
          color: _color, // Definindo a cor do container
          child: ListView(
            // Definindo uma list View um componente que permite rolagem
            children: <Widget>[
              // Filhos do ListView
              const Logo(), // Widget de logo (criando manualmente)
              _completed // Operação ternária (if else)
                  ? Sucess(
                      result: _resultText,
                      reset: reset,
                    ) // Casso _completed seja true exiba o Widget Sucess() -> Estamos também passando alguns valores requeridos no construtor do Widget Sucess
                  : SubmitForm(
                      gasCtrl: _gasCtrl,
                      alcCtrl: _alcCtrl,
                      busy: _busy,
                      submitForm: calculate,
                      // Caso _completed seja false exiba o Widget SubitForm() -> Estamos passando alguns valores no construtor necessário para a criação do Widget
                    )
            ],
          ),
        ));
  }

  Future calculate() {
    // Definindo o método que é usado para fazer o calculo, estamos passando esse método no construtor do Widget SubmitForm, pois esse calculo só vai ser feito quando o usuario clicar no botão calcular no formulario, e isso está presente dentro do widget
    double alc = double.parse(_alcCtrl.text.replaceAll(RegExp(r'[,.]'), '')) /
        100; // Limpando virgulas e tranformando em ponto e após isso transformando em um double
    double gas = double.parse(_gasCtrl.text.replaceAll(RegExp(r'[,.]'), '')) /
        100; // Limpando virgulas e tranformando em ponto e após isso transformando em um double

    double res = alc / gas; // Realizando o calculo.

    setState(() {
      // Setando o estado para ter uma atualização na tela Statefull
      _color = Color.fromARGB(255, 91, 112,
          229); // Definindo uma cor e essa cor vai ter alterada na animação pelo uso co AnimatedContainer
      _completed = false; //Definindo completed como false
      _busy =
          true; // Definindo o busy como true para que o incone  de loading seja exibido
    });

    return Future.delayed(
        // Definindo o retorno do método que é um Future com delay.
        const Duration(seconds: 2), // Definindo o Delay de 2 seg
        (() => {
              setState(() => {
                    // Setando um novo estado para atualizar a tela, e como estamos usando o animatedcontainer vai ter uma animação de transição para o novo estado
                    if (res >= 0.7) // Validação
                      {_resultText = "Compesa utilizar Gasolina"}
                    else
                      {_resultText = "Compresa utilizar Álcool"},
                    _busy =
                        false, // Setando busy como false para subir o laoding
                    _completed =
                        true // Setando completed como true para carregar o Widget de Sucess.
                  })
            }));
  }

  reset() {
    setState(() {
      _color = Colors.indigo;
      _alcCtrl = MoneyMaskedTextController();
      _gasCtrl = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
