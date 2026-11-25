import 'package:flutter/material.dart';
import 'pergunta.dart';
import 'questoes.dart';

void main() {
  runApp(const Janela());
}

class Janela extends StatelessWidget {
  const Janela({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Principal()),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  Pergunta controle = questoes[0];
  final controlaTexto = TextEditingController();
  String mensagem = "Incorreto";

  @override
  void dispose() {
    controlaTexto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(controle.texto),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controlaTexto,
            onChanged: (value) {
              setState(() {
                if (value == controle.resposta) {
                  mensagem = "Correta!";
                } else {
                  mensagem = "Incorreta!";
                }
              });
            },
          ),
        ),
        Text(mensagem),
      ],
    );
  }
}
