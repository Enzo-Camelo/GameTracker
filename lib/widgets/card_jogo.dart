import 'package:flutter/material.dart';

import '../../cores.dart';
import '../../modelos/jogo.dart';

class CardJogo extends StatelessWidget {
  final Jogo jogo;
  final VoidCallback aoTocar;

  const CardJogo({super.key, required this.jogo, required this.aoTocar});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoTocar,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.fundoCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Imagem: usa asset se disponível, senão o icone mockado
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: jogo.corImagem.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: jogo.capa != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        jogo.capa!,
                        fit: BoxFit.cover,
                        width: 56,
                        height: 56,
                      ),
                    )
                  : Icon(jogo.imagem, color: jogo.corImagem, size: 28),
            ),
            const SizedBox(width: 14),

            // Nome, genero e plataforma
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

            // Avaliação
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: AppColors.estrela,
                  size: 18,
                ),
                const SizedBox(width: 4),
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
      ),
    );
  }
}
