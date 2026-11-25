import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_tracker/modelos/jogo.dart';

void main() {
  test('cria um jogo com os dados informados', () {
    final jogo = Jogo(
      nome: 'The Witcher 3',
      imagem: Icons.auto_stories,
      corImagem: Colors.blue,
      genero: 'RPG',
      plataforma: 'PC',
      descricao: 'Um RPG de mundo aberto.',
      horasJogadas: 45,
      avaliacao: 9.5,
      capa: 'assets/witcher.jpg',
    );

    expect(jogo.nome, 'The Witcher 3');
    expect(jogo.genero, 'RPG');
    expect(jogo.plataforma, 'PC');
    expect(jogo.horasJogadas, 45);
    expect(jogo.avaliacao, 9.5);
  });

  test('permite criar um jogo sem capa', () {
    final jogo = Jogo(
      nome: 'Jogo sem capa',
      imagem: Icons.games,
      corImagem: Colors.grey,
      genero: 'Aventura',
      plataforma: 'PC',
      descricao: 'Descrição do jogo.',
      horasJogadas: 0,
      avaliacao: 0,
    );

    expect(jogo.capa, isNull);
  });

  test('permite atualizar horas jogadas e avaliação', () {
    final jogo = Jogo(
      nome: 'God of War',
      imagem: Icons.flash_on,
      corImagem: Colors.red,
      genero: 'Ação',
      plataforma: 'PlayStation',
      descricao: 'Descrição do jogo.',
      horasJogadas: 10,
      avaliacao: 8,
    );

    jogo.horasJogadas = 30;
    jogo.avaliacao = 9;

    expect(jogo.horasJogadas, 30);
    expect(jogo.avaliacao, 9);
  });

  group('horas jogadas não podem ser negativas', () {
    Jogo criarJogo(double horas) => Jogo(
          nome: 'Stardew Valley',
          imagem: Icons.agriculture,
          corImagem: Colors.green,
          genero: 'Simulação',
          plataforma: 'PC',
          descricao: 'Descrição do jogo.',
          horasJogadas: horas,
          avaliacao: 8,
        );

    test('recusa criar um jogo com horas negativas', () {
      expect(() => criarJogo(-1), throwsArgumentError);
    });

    test('recusa atualizar para horas negativas e mantém o valor anterior', () {
      final jogo = criarJogo(12);

      expect(() => jogo.horasJogadas = -0.5, throwsArgumentError);
      expect(jogo.horasJogadas, 12);
    });

    test('aceita zero horas (jogo ainda não iniciado)', () {
      expect(criarJogo(0).horasJogadas, 0);
    });
  });
}
