import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'pergunta': 'Onde é que tem dois sete, dois zeros?',
      'respostas': [
        {'texto': 'A - 7700', 'nota': 0},
        {'texto': 'B - 2720', 'nota': 0},
        {'texto': 'C - 2700', 'nota': 1},
        {'texto': 'D - 7720', 'nota': 0},
      ],
    },
    {
      'pergunta':
          'Há 10 peixes em um aquário, 3 se afogam, 2 fogem nadando, 5 morrem. Quantos sobram ?',
      'respostas': [
        {'texto': 'A - 0', 'nota': 0},
        {'texto': 'B - 2', 'nota': 0},
        {'texto': 'C - 5', 'nota': 0},
        {'texto': 'D - 10', 'nota': 1},
      ],
    },
    {
      'pergunta':
          'Se tenho 5 touros vendo 2, ganhei 3, com quantos eu fiquei ?',
      'respostas': [
        {'texto': 'A - 8', 'nota': 1},
        {'texto': 'B - 6', 'nota': 0},
        {'texto': 'C - 5', 'nota': 0},
        {'texto': 'D - 3', 'nota': 0},
      ],
    },
    {
      'pergunta':
          'Em uma sala há 4 cantos. Cada gato vê 3 cantos. Quantos gatos têm na sala ?',
      'respostas': [
        {'texto': 'A - 12', 'nota': 0},
        {'texto': 'B - 4', 'nota': 1},
        {'texto': 'C - 16', 'nota': 0},
        {'texto': 'D - 8', 'nota': 0},
      ],
    },
    {
      'pergunta': 'O pai de Maria tem 5 filhas : Lala, Lele, Lili, Lolo e ??',
      'respostas': [
        {'texto': 'A - Lalu', 'nota': 0},
        {'texto': 'B - Lulu', 'nota': 0},
        {'texto': 'C - Lolu', 'nota': 0},
        {'texto': 'D - Maria', 'nota': 1},
      ],
    },
    {
      'pergunta': 'Que número é maior que -50 ?',
      'respostas': [
        {'texto': 'A - -60', 'nota': 0},
        {'texto': 'B - -80', 'nota': 0},
        {'texto': 'C - -40', 'nota': 1},
        {'texto': 'D - -90', 'nota': 0},
      ],
    },
    {
      'pergunta':
          'Um garoto, João, e seu irmão maior, Pedro, jogam futebol. Ao todo quantos jogam futebol ?',
      'respostas': [
        {'texto': 'A - 4', 'nota': 0},
        {'texto': 'B - 2', 'nota': 1},
        {'texto': 'C - 3', 'nota': 0},
        {'texto': 'D - 5', 'nota': 0},
      ],
    },
    {
      'pergunta':
          'Uma pessoa estava lendo um livro e arrancou as páginas 6,8,84,85,111 e 112. Quantas folhas arrancou no total ?',
      'respostas': [
        {'texto': 'A - 3', 'nota': 0},
        {'texto': 'B - 4', 'nota': 0},
        {'texto': 'C - 5', 'nota': 1},
        {'texto': 'D - 6', 'nota': 0},
        {'texto': 'E - 7', 'nota': 0},
      ],
    },
    {
      'pergunta':
          'Se em uma caixa de ovos de 5 dúzias, 3 ovos de cada dezena são quebrados. Quantos ovos estão intactos ?',
      'respostas': [
        {'texto': 'A - 57', 'nota': 0},
        {'texto': 'B - 42', 'nota': 1},
        {'texto': 'C - 45', 'nota': 0},
        {'texto': 'D - 0', 'nota': 0},
      ],
    },
    {
      'pergunta': '3+3x3+3',
      'respostas': [
        {'texto': 'A - 27', 'nota': 0},
        {'texto': 'B - 21', 'nota': 0},
        {'texto': 'C - 36', 'nota': 0},
        {'texto': 'D - 15', 'nota': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pensando bem...'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
