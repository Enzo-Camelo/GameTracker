import 'package:flutter/material.dart';

import '../../cores.dart';
import '../telas/tela_dashboard.dart';
import '../telas/tela_lista_jogos.dart';
import '../telas/tela_estatisticas.dart';
import '../telas/tela_o_que_jogar.dart';

class BarraNavegacao extends StatelessWidget {
  final int currentIndex;

  const BarraNavegacao({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        if (index == currentIndex) return;
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => const TelaDashboard()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => const TelaListaJogos()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => const TelaEstatisticas()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => const TelaOQueJogar()),
            );
            break;
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'Início',
        ),
        NavigationDestination(
          icon: Icon(Icons.list_alt_outlined),
          selectedIcon: Icon(Icons.list_alt_rounded),
          label: 'Lista',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_outlined),
          selectedIcon: Icon(Icons.bar_chart_rounded),
          label: 'Estatísticas',
        ),
        NavigationDestination(
          icon: Icon(Icons.casino_outlined),
          selectedIcon: Icon(Icons.casino_rounded),
          label: 'Sortear',
        ),
      ],
    );
  }
}
