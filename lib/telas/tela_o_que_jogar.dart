import 'dart:math';

import 'package:flutter/material.dart';

import '../../cores.dart';
import '../../dados/jogos_mock.dart';
import '../../modelos/jogo.dart';
import '../widgets/barra_navegacao.dart';

class TelaOQueJogar extends StatefulWidget {
  const TelaOQueJogar({super.key});

  @override
  State<TelaOQueJogar> createState() => TelaOQueJogarState();
}

class TelaOQueJogarState extends State<TelaOQueJogar> {
  Jogo? jogoSorteado;
  Random gerador = Random();

  void sortearJogo() {
    setState(() {
      int indiceSorteado = gerador.nextInt(listaDeJogos.length);
      jogoSorteado = listaDeJogos[indiceSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fundo,
      appBar: AppBar(title: const Text('O que jogar?')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: jogoSorteado == null
                    ? const Text(
                        'Toque no botão abaixo para sortear um jogo da sua coleção.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textoSecundario,
                          fontSize: 15,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.fundoCard,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: jogoSorteado!.corImagem.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: jogoSorteado!.capa != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        jogoSorteado!.capa!,
                                        fit: BoxFit.cover,
                                        width: 200,
                                        height: 200,
                                      ),
                                    )
                                  : Icon(
                                      jogoSorteado!.imagem,
                                      color: jogoSorteado!.corImagem,
                                      size: 48,
                                    ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              jogoSorteado!.nome,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppColors.texto,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${jogoSorteado!.genero} • ${jogoSorteado!.plataforma}',
                              style: const TextStyle(
                                color: AppColors.textoSecundario,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.schedule_rounded, color: AppColors.textoSecundario, size: 16),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${jogoSorteado!.horasJogadas.toStringAsFixed(0)} h',
                                      style: const TextStyle(
                                        color: AppColors.texto,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 18),
                                Row(
                                  children: [
                                    const Icon(Icons.star_rounded, color: AppColors.estrela, size: 16),
                                    const SizedBox(width: 6),
                                    Text(
                                      jogoSorteado!.avaliacao.toStringAsFixed(1),
                                      style: const TextStyle(
                                        color: AppColors.texto,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: sortearJogo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaria,
                  foregroundColor: AppColors.texto,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.casino_rounded),
                label: Text(
                  jogoSorteado == null ? 'Sortear jogo' : 'Sortear novamente',
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 3),
    );
  }
}
