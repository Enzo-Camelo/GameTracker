import 'package:flutter/material.dart';

import '../../modelos/jogo.dart';
import '../../cores.dart';

List<Jogo> listaDeJogos = [
  Jogo(
    nome: 'The Witcher 3',
    imagem: Icons.auto_stories,
    corImagem: AppColors.coresGrafico[0],
    genero: 'RPG',
    plataforma: 'PC',
    descricao:
        'Um RPG de mundo aberto em que Geralt de Rívia parte em busca de '
        'sua filha adotiva em um continente marcado pela guerra e pela magia.',
    horasJogadas: 45,
    avaliacao: 9.5,
    capa: 'assets/witcher.jpg',
  ),
  Jogo(
    nome: 'God of War',
    imagem: Icons.flash_on,
    corImagem: AppColors.coresGrafico[1],
    genero: 'Ação',
    plataforma: 'PlayStation',
    descricao:
        'Kratos e seu filho Atreus enfrentam monstros e deuses nórdicos '
        'em uma jornada sobre paternidade e redenção.',
    horasJogadas: 30,
    avaliacao: 9.0,
    capa: 'assets/godofwar.png',
  ),
  Jogo(
    nome: 'FIFA 24',
    imagem: Icons.sports_soccer,
    corImagem: AppColors.coresGrafico[2],
    genero: 'Esporte',
    plataforma: 'PlayStation',
    descricao:
        'Simulador de futebol com times, campeonatos e modos de carreira '
        'para jogar sozinho ou com amigos.',
    horasJogadas: 20,
    avaliacao: 7.5,
    capa: 'assets/fifa24.jpg',
  ),
  Jogo(
    nome: 'Forza Horizon 5',
    imagem: Icons.directions_car,
    corImagem: AppColors.coresGrafico[3],
    genero: 'Corrida',
    plataforma: 'Xbox',
    descricao:
        'Corridas em mundo aberto ambientadas no México, com dezenas de '
        'carros e eventos espalhados pelo mapa.',
    horasJogadas: 15,
    avaliacao: 8.5,
    capa: 'assets/forza5.jpg',
  ),
  Jogo(
    nome: 'Stardew Valley',
    imagem: Icons.agriculture,
    corImagem: AppColors.coresGrafico[4],
    genero: 'Simulação',
    plataforma: 'PC',
    descricao:
        'Jogo de simulação de fazenda em que o jogador planta, cria animais '
        'e constrói relações com os moradores da vila.',
    horasJogadas: 60,
    avaliacao: 9.0,
    capa: 'assets/stardew.jpg',
  ),
  Jogo(
    nome: 'Civilization VI',
    imagem: Icons.psychology,
    corImagem: AppColors.coresGrafico[5],
    genero: 'Estratégia',
    plataforma: 'PC',
    descricao:
        'Jogo de estratégia por turnos em que o jogador constrói e '
        'conduz uma civilização do início ao fim da história.',
    horasJogadas: 80,
    avaliacao: 8.0,
    capa: 'assets/civilizationVI.jpg',
  ),
  Jogo(
    nome: 'Resident Evil 4',
    imagem: Icons.nightlight,
    corImagem: AppColors.coresGrafico[6],
    genero: 'Terror',
    plataforma: 'PlayStation',
    descricao:
        'Leon S. Kennedy precisa resgatar a filha do presidente em uma '
        'vila infestada por uma ameaça parasitária.',
    horasJogadas: 12,
    avaliacao: 9.2,
    capa: 'assets/resident_evil_4.jpg',
  ),
  Jogo(
    nome: 'Zelda: Tears of the Kingdom',
    imagem: Icons.terrain,
    corImagem: AppColors.coresGrafico[7],
    genero: 'Aventura',
    plataforma: 'Switch',
    descricao:
        'Link explora céu, superfície e subterrâneo de Hyrule para deter '
        'uma ameaça que ressurge do passado.',
    horasJogadas: 50,
    avaliacao: 9.8,
    capa: 'assets/zelda.jpg',
  ),
];
