import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../cores.dart';
import '../../dados/jogos_mock.dart';
import '../../modelos/jogo.dart';
import '../../widgets/cartao_estatistica.dart';
import '../widgets/barra_navegacao.dart';

class TelaEstatisticas extends StatefulWidget {
  const TelaEstatisticas({super.key});

  @override
  State<TelaEstatisticas> createState() => TelaEstatisticasState();
}

class TelaEstatisticasState extends State<TelaEstatisticas> {
  @override
  Widget build(BuildContext context) {
    Jogo jogoComMaisHoras = listaDeJogos[0];
    for (var jogo in listaDeJogos) {
      if (jogo.horasJogadas > jogoComMaisHoras.horasJogadas) {
        jogoComMaisHoras = jogo;
      }
    }

    Jogo jogoMaisBemAvaliado = listaDeJogos[0];
    for (var jogo in listaDeJogos) {
      if (jogo.avaliacao > jogoMaisBemAvaliado.avaliacao) {
        jogoMaisBemAvaliado = jogo;
      }
    }

    double totalDeHoras = 0;
    for (var jogo in listaDeJogos) {
      totalDeHoras = totalDeHoras + jogo.horasJogadas;
    }

    double somaDasAvaliacoes = 0;
    for (var jogo in listaDeJogos) {
      somaDasAvaliacoes = somaDasAvaliacoes + jogo.avaliacao;
    }
    double mediaDasAvaliacoes = somaDasAvaliacoes / listaDeJogos.length;

    double maiorValorDeHoras = 0;
    for (var jogo in listaDeJogos) {
      if (jogo.horasJogadas > maiorValorDeHoras) {
        maiorValorDeHoras = jogo.horasJogadas;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.fundo,
      appBar: AppBar(title: const Text('Estatísticas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Horas jogadas por jogo',
              style: TextStyle(
                color: AppColors.texto,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              height: 260,
              padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
              decoration: BoxDecoration(
                color: AppColors.fundoCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: BarChart(
                BarChartData(
                  maxY: maiorValorDeHoras + 10,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32,
                        getTitlesWidget: (valor, meta) {
                          return Text(
                            valor.toStringAsFixed(0),
                            style: const TextStyle(
                              color: AppColors.textoSecundario,
                              fontSize: 11,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (valor, meta) {
                          int indice = valor.toInt();
                          if (indice < 0 || indice >= listaDeJogos.length) {
                            return const SizedBox.shrink();
                          }
                          String nomeCurto =
                              listaDeJogos[indice].nome.length > 3
                              ? listaDeJogos[indice].nome.substring(0, 3)
                              : listaDeJogos[indice].nome;
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              nomeCurto,
                              style: const TextStyle(
                                color: AppColors.textoSecundario,
                                fontSize: 11,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: List.generate(listaDeJogos.length, (indice) {
                    var jogo = listaDeJogos[indice];
                    return BarChartGroupData(
                      x: indice,
                      barRods: [
                        BarChartRodData(
                          toY: jogo.horasJogadas,
                          color:
                              AppColors.coresGrafico[indice %
                                  AppColors.coresGrafico.length],
                          width: 18,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 28),
            const Text(
              'Resumo da coleção',
              style: TextStyle(
                color: AppColors.texto,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: CartaoEstatistica(
                    icone: Icons.emoji_events_rounded,
                    titulo: 'Mais jogado',
                    valor: jogoComMaisHoras.nome,
                    corIcone: AppColors.secundaria,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CartaoEstatistica(
                    icone: Icons.star_rounded,
                    titulo: 'Melhor avaliado',
                    valor: jogoMaisBemAvaliado.nome,
                    corIcone: AppColors.estrela,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: CartaoEstatistica(
                    icone: Icons.schedule_rounded,
                    titulo: 'Total de horas',
                    valor: totalDeHoras.toStringAsFixed(0),
                    corIcone: AppColors.primaria,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CartaoEstatistica(
                    icone: Icons.analytics_rounded,
                    titulo: 'Média das avaliações',
                    valor: mediaDasAvaliacoes.toStringAsFixed(1),
                    corIcone: AppColors.sucesso,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 2),
    );
  }
}
