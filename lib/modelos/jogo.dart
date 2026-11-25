import 'package:flutter/material.dart';

class Jogo {
  String nome;
  IconData imagem;
  Color corImagem;
  String genero;
  String plataforma;
  String descricao;
  double _horasJogadas;
  double avaliacao;
  String? capa;

  Jogo({
    required this.nome,
    required this.imagem,
    required this.corImagem,
    required this.genero,
    required this.plataforma,
    required this.descricao,
    required double horasJogadas,
    required this.avaliacao,
    this.capa,
  }) : _horasJogadas = _validarHoras(horasJogadas);

  double get horasJogadas => _horasJogadas;

  set horasJogadas(double valor) => _horasJogadas = _validarHoras(valor);

  static double _validarHoras(double valor) {
    if (valor < 0) {
      throw ArgumentError.value(
        valor,
        'horasJogadas',
        'não pode ser negativo',
      );
    }
    return valor;
  }
}
