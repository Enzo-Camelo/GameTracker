import 'package:flutter/material.dart';

import '../../cores.dart';
import '../../modelos/jogo.dart';
import '../widgets/barra_navegacao.dart';

class TelaDetalhesJogo extends StatefulWidget {
  final Jogo jogo;

  const TelaDetalhesJogo({super.key, required this.jogo});

  @override
  State<TelaDetalhesJogo> createState() => TelaDetalhesJogoState();
}

class TelaDetalhesJogoState extends State<TelaDetalhesJogo> {
  double avaliacaoMinima = 0;
  double avaliacaoMaxima = 10;

  void aumentarHoras() {
    setState(() {
      widget.jogo.horasJogadas = widget.jogo.horasJogadas + 1;
    });
  }

  void diminuirHoras() {
    setState(() {
      if (widget.jogo.horasJogadas - 1 >= 0) {
        widget.jogo.horasJogadas = widget.jogo.horasJogadas - 1;
      } else {
        widget.jogo.horasJogadas = 0;
      }
    });
  }

  void aumentarAvaliacao() {
    setState(() {
      if (widget.jogo.avaliacao + 0.5 <= avaliacaoMaxima) {
        widget.jogo.avaliacao = widget.jogo.avaliacao + 0.5;
      } else {
        widget.jogo.avaliacao = avaliacaoMaxima;
      }
    });
  }

  void diminuirAvaliacao() {
    setState(() {
      if (widget.jogo.avaliacao - 0.5 >= avaliacaoMinima) {
        widget.jogo.avaliacao = widget.jogo.avaliacao - 0.5;
      } else {
        widget.jogo.avaliacao = avaliacaoMinima;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fundo,
      appBar: AppBar(title: Text(widget.jogo.nome)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  color: widget.jogo.corImagem.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: widget.jogo.capa != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          widget.jogo.capa!,
                          fit: BoxFit.cover,
                          width: 280,
                          height: 280,
                        ),
                      )
                    : Icon(
                        widget.jogo.imagem,
                        color: widget.jogo.corImagem,
                        size: 56,
                      ),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Text(
                widget.jogo.nome,
                style: const TextStyle(
                  color: AppColors.texto,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                '${widget.jogo.genero} • ${widget.jogo.plataforma}',
                style: const TextStyle(
                  color: AppColors.textoSecundario,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Descrição',
              style: TextStyle(
                color: AppColors.texto,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.jogo.descricao,
              style: const TextStyle(
                color: AppColors.textoSecundario,
                fontSize: 14,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 28),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.fundoCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Horas jogadas',
                    style: TextStyle(
                      color: AppColors.textoSecundario,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: diminuirHoras,
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: AppColors.perigo,
                        ),
                        iconSize: 32,
                      ),
                      Text(
                        widget.jogo.horasJogadas.toStringAsFixed(0),
                        style: const TextStyle(
                          color: AppColors.texto,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: aumentarHoras,
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: AppColors.sucesso,
                        ),
                        iconSize: 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.fundoCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Avaliação (0 a 10)',
                    style: TextStyle(
                      color: AppColors.textoSecundario,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: diminuirAvaliacao,
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: AppColors.perigo,
                        ),
                        iconSize: 32,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.estrela,
                            size: 26,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.jogo.avaliacao.toStringAsFixed(1),
                            style: const TextStyle(
                              color: AppColors.texto,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: aumentarAvaliacao,
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: AppColors.sucesso,
                        ),
                        iconSize: 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 1),
    );
  }
}
