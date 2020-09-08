import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  String _frase;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 6) {
      _frase = 'Tente novamente!';
    } else if (pontuacao < 8) {
      _frase = 'Você é bom!';
    } else if (pontuacao < 9) {
      _frase = 'Impressionante!';
    } else if (pontuacao <= 10) {
      _frase = 'Você é um Jedi!';
    }
    return _frase;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Center(
          child: Text(
            'Pontuação ${pontuacao}',
            style: TextStyle(fontSize: 28, color: Colors.red),
          ),
        ),
        FlatButton(
          child: Text(
            'Tentar novamente!',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        ),
      ],
    );
  }
}
