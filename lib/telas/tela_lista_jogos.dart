import 'package:flutter/material.dart';

import '../../cores.dart';
import '../../dados/jogos_mock.dart';
import '../../widgets/card_jogo.dart';
import '../widgets/barra_navegacao.dart';
import 'tela_detalhes_jogo.dart';

class TelaListaJogos extends StatefulWidget {
  const TelaListaJogos({super.key});

  @override
  State<TelaListaJogos> createState() => TelaListaJogosState();
}

class TelaListaJogosState extends State<TelaListaJogos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fundo,
      appBar: AppBar(title: const Text('Lista de jogos')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: listaDeJogos.length,
        separatorBuilder: (context, indice) => const SizedBox(height: 12),
        itemBuilder: (context, indice) {
          var jogo = listaDeJogos[indice];
          return CardJogo(
            jogo: jogo,
            aoTocar: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaDetalhesJogo(jogo: jogo),
                ),
              );
              setState(() {});
            },
          );
        },
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 1),
    );
  }
}
