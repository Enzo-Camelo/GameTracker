import 'package:flutter/material.dart';

class Jogo {
  String nome;
  IconData imagem;
  Color corImagem;
  String genero;
  String plataforma;
  String descricao;
  double horasJogadas;
  double avaliacao;
  String? capa;

  Jogo({
    required this.nome,
    required this.imagem,
    required this.corImagem,
    required this.genero,
    required this.plataforma,
    required this.descricao,
    required this.horasJogadas,
    required this.avaliacao,
    this.capa,
  });
}
