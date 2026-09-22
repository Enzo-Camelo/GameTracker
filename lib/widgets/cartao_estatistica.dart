import 'package:flutter/material.dart';

import '../../cores.dart';

class CartaoEstatistica extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String valor;
  final Color corIcone;
  final bool compact;
  final double? height;

  const CartaoEstatistica({
    super.key,
    required this.icone,
    required this.titulo,
    required this.valor,
    this.corIcone = AppColors.primaria,
    this.compact = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final padding = compact ? 10.0 : 16.0;
    final iconSize = compact ? 18.0 : 22.0;
    final valueSize = compact ? 16.0 : 20.0;
    final titleSize = compact ? 12.0 : 13.0;

    Widget card = Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.fundoCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: corIcone, size: iconSize),
          SizedBox(height: compact ? 8 : 10),
          Text(
            valor,
            style: TextStyle(
              color: AppColors.texto,
              fontSize: valueSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: compact ? 4 : 4),
          Text(
            titulo,
            style: TextStyle(
              color: AppColors.textoSecundario,
              fontSize: titleSize,
            ),
          ),
        ],
      ),
    );

    if (height != null) {
      return SizedBox(height: height, child: card);
    }
    return card;
  }
}
