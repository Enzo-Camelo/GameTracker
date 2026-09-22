import 'package:flutter/material.dart';

import '../../cores.dart';

class BotaoNavegacao extends StatelessWidget {
  final IconData icone;
  final String texto;
  final Color cor;
  final VoidCallback aoTocar;

  const BotaoNavegacao({
    super.key,
    required this.icone,
    required this.texto,
    required this.aoTocar,
    this.cor = AppColors.primaria,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoTocar,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.fundoCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icone, color: cor, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                texto,
                style: const TextStyle(
                  color: AppColors.texto,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.textoSecundario,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
