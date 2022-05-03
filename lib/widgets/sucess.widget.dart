import 'package:flutter/material.dart';

import 'loading-button-widge.dart';

class Sucess extends StatelessWidget {
  Sucess({
    Key? key,
    required this.result,
    required this.reset,
  }) : super(key: key);

  var result = "";
  VoidCallback reset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        Text(
          result,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 40,
            fontFamily: "Big Shoulders Display",
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        LoadingButton(
            busy: false,
            invert: true,
            text: "Calcular Novamente",
            backgroundColor: Theme.of(context).primaryColor,
            colorText: Colors.white,
            onPressed: reset)
      ]),
    );
  }
}
