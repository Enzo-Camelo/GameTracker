import 'package:flutter/material.dart';

import '../../cores.dart';
import '../../dados/jogos_mock.dart';
import '../../widgets/cartao_estatistica.dart';
import '../../widgets/botao_navegacao.dart';
import '../widgets/barra_navegacao.dart';
import 'tela_lista_jogos.dart';
import 'tela_estatisticas.dart';
import 'tela_o_que_jogar.dart';
import 'tela_detalhes_jogo.dart';

class TelaDashboard extends StatefulWidget {
  const TelaDashboard({super.key});

  @override
  State<TelaDashboard> createState() => TelaDashboardState();
}

class TelaDashboardState extends State<TelaDashboard> {
  @override
  Widget build(BuildContext context) {
    int totalDeJogos = listaDeJogos.length;

    double totalDeHoras = 0;
    for (var jogo in listaDeJogos) {
      totalDeHoras = totalDeHoras + jogo.horasJogadas;
    }

    double somaDasAvaliacoes = 0;
    for (var jogo in listaDeJogos) {
      somaDasAvaliacoes = somaDasAvaliacoes + jogo.avaliacao;
    }
    double mediaDasAvaliacoes = somaDasAvaliacoes / listaDeJogos.length;

    return Scaffold(
      backgroundColor: AppColors.fundo,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Game Tracker',
                style: TextStyle(
                  color: AppColors.texto,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Sua coleção de jogos, em um só lugar',
                style: TextStyle(
                  color: AppColors.textoSecundario,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: CartaoEstatistica(
                        icone: Icons.videogame_asset_rounded,
                        titulo: 'Jogos',
                        valor: '$totalDeJogos',
                        corIcone: AppColors.primaria,
                        compact: true,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: CartaoEstatistica(
                        icone: Icons.schedule_rounded,
                        titulo: 'Horas',
                        valor: totalDeHoras.toStringAsFixed(0),
                        corIcone: AppColors.secundaria,
                        compact: true,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: CartaoEstatistica(
                        icone: Icons.star_rounded,
                        titulo: 'Média',
                        valor: mediaDasAvaliacoes.toStringAsFixed(1),
                        corIcone: AppColors.estrela,
                        compact: true,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              const SizedBox(height: 12),
              const Text(
                'Favoritos',
                style: TextStyle(
                  color: AppColors.texto,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Builder(builder: (context) {
                var copia = List.from(listaDeJogos);
                copia.sort((a, b) {
                  final nota = b.avaliacao.compareTo(a.avaliacao);
                  if (nota != 0) return nota;
                  return b.horasJogadas.compareTo(a.horasJogadas);
                });
                var top = copia.take(copia.length >= 3 ? 3 : copia.length).toList();
                return Column(
                  children: top.map((jogo) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => TelaDetalhesJogo(jogo: jogo),
                            ),
                          );
                          setState(() {});
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.fundoCard,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: jogo.corImagem.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: jogo.capa != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          jogo.capa!,
                                          fit: BoxFit.cover,
                                          width: 56,
                                          height: 56,
                                        ),
                                      )
                                    : Icon(jogo.imagem, color: jogo.corImagem, size: 28),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      jogo.nome,
                                      style: const TextStyle(
                                        color: AppColors.texto,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${jogo.genero} • ${jogo.plataforma}',
                                      style: const TextStyle(
                                        color: AppColors.textoSecundario,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.schedule, color: AppColors.textoSecundario, size: 16),
                                      const SizedBox(width: 6),
                                      Text(
                                        jogo.horasJogadas.toStringAsFixed(0),
                                        style: const TextStyle(
                                          color: AppColors.texto,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: AppColors.estrela, size: 16),
                                      const SizedBox(width: 6),
                                      Text(
                                        jogo.avaliacao.toStringAsFixed(1),
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
                    );
                  }).toList(),
                );
              }),

              const SizedBox(height: 28),
              const Text(
                'Explorar',
                style: TextStyle(
                  color: AppColors.texto,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              BotaoNavegacao(
                icone: Icons.list_alt_rounded,
                texto: 'Lista de jogos',
                cor: AppColors.secundaria,
                aoTocar: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaListaJogos(),
                    ),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 12),
              BotaoNavegacao(
                icone: Icons.bar_chart_rounded,
                texto: 'Estatísticas',
                cor: AppColors.secundaria,
                aoTocar: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaEstatisticas(),
                    ),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 12),
              BotaoNavegacao(
                icone: Icons.casino_rounded,
                texto: 'O que jogar?',
                cor: AppColors.secundaria,
                aoTocar: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaOQueJogar(),
                    ),
                  );
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }
}
