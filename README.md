# GameTracker

App Flutter para acompanhar a coleção de jogos: dashboard, lista, detalhes, estatísticas
(gráficos com `fl_chart`) e a tela "O que jogar?". Os dados atuais são mock
(`lib/dados/jogos_mock.dart`).

Projeto da disciplina de Gerência de Configuração e Processos de Software. A gestão de
configuração segue o [Plano de GCS](docs/plano-gcs.md); a referência usada é o
repositório [lzcamargo/ongconecta](https://github.com/lzcamargo/ongconecta).

## Estrutura do repositório

| Pasta / arquivo | Conteúdo |
|---|---|
| `lib/` | código do app (`telas/`, `widgets/`, `modelos/`, `dados/`, `cores.dart`, `main.dart`) |
| `test/` | testes automatizados (`flutter test`) |
| `assets/` | imagens dos jogos |
| `android/ ios/ web/ linux/ macos/ windows/` | projetos de plataforma gerados pelo Flutter |
| `pubspec.yaml` / `pubspec.lock` | dependências e versões exatas (lockfile versionado) |
| `.github/workflows/` | pipelines: `ci.yml` (PR e main), `release.yml` (build do APK na main) |
| `.github/` | `CODEOWNERS`, template de PR, templates de Issue, `dependabot.yml` |
| `docs/` | [plano de GCS](docs/plano-gcs.md), [roteiro de configuração no GitHub](docs/roteiro-github.md), [evidências](docs/evidencias/README.md) |
| `.env.example` | nomes de variáveis de ambiente (sem valores reais) |

## Como instalar e rodar

Pré-requisito: [Flutter](https://docs.flutter.dev/get-started/install) (stable; o CI usa a 3.47.2).

```bash
git clone https://github.com/Enzo-Camelo/GameTracker.git
cd GameTracker
flutter pub get
flutter run            # escolha um dispositivo/emulador
```

## Como rodar os testes

```bash
flutter analyze
flutter test
```

## Fluxo de trabalho (resumo)

1. Crie uma branch a partir da `main`: `feature/<issue>-<descricao>`.
2. Commits e **título do PR** em [Conventional Commits](https://www.conventionalcommits.org/) (`feat(lista): ...`).
3. Abra um Pull Request; o CI roda análise, testes e build.
4. O par de revisão aprova; merge **somente por squash**.
5. Push direto na `main` é recusado (proteção de branch).

Detalhes em [docs/plano-gcs.md](docs/plano-gcs.md).

## Ambientes

| Ambiente | Como é atingido | Aprovação |
|---|---|---|
| `staging` | merge na `main` | automática |
| `production` | após staging | **revisor obrigatório: @Enzo-Camelo** |

Os Environments existem no GitHub; o deploy real entra na Aula 3 (hoje o `release.yml`
gera o APK como artefato).

## Equipe

- Desenvolvedor Líder: [@Enzo-Camelo](https://github.com/Enzo-Camelo)
- Par de revisão: `@camelo-dev` (colaborador com acesso de escrita)
