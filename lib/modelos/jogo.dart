import 'package:flutter/material.dart';

class Jogo {
  String nome;
  IconData imagem;
  Color corImagem;
  String genero;
  String plataforma;
  String descricao;
  double _horasJogadas;
  double _avaliacao;
  String? capa;

  static const double avaliacaoMinima = 0;
  static const double avaliacaoMaxima = 10;

  Jogo({
    required this.nome,
    required this.imagem,
    required this.corImagem,
    required this.genero,
    required this.plataforma,
    required this.descricao,
    required double horasJogadas,
    required double avaliacao,
    this.capa,
  })  : _horasJogadas = _validarHoras(horasJogadas),
        _avaliacao = _validarAvaliacao(avaliacao);

  double get avaliacao => _avaliacao;

  set avaliacao(double valor) => _avaliacao = _validarAvaliacao(valor);

  static double _validarAvaliacao(double valor) {
    if (valor < avaliacaoMinima || valor > avaliacaoMaxima) {
      throw ArgumentError.value(
        valor,
        'avaliacao',
        'deve estar entre $avaliacaoMinima e $avaliacaoMaxima',
      );
    }
    return valor;
  }

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
