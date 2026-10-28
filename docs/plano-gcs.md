# Plano de Gerência de Configuração de Software (GCS) — GameTracker

- Projeto: GameTracker (app Flutter) — repositório `Enzo-Camelo/GameTracker`
- Responsável: Enzo Camelo (Desenvolvedor Líder)
- Referência: PGC do repositório [lzcamargo/ongconecta](https://github.com/lzcamargo/ongconecta)
- Este arquivo é um item de configuração: **só muda por Pull Request revisado**.

## 1. Objetivo e escopo

Garantir que todo artefato do GameTracker (código, dependências, pipelines, documentação)
seja identificado, versionado, alterado de forma controlada, verificado automaticamente e
entregue de forma rastreável.

## 2. Papéis

| Papel | Quem | Responsabilidades |
|---|---|---|
| Desenvolvedor Líder | @Enzo-Camelo | mantém o plano, é dono (CODEOWNERS) de pipelines/dependências/docs, **revisor obrigatório do Environment `production`**, preside o CCM |
| Par de revisão | `@camelo-dev` | colaborador com acesso de escrita; revisa e aprova os PRs do líder (o GitHub não permite aprovar o próprio PR); o líder revisa os dele |
| CCM (Comitê de Controle de Mudanças) | líder + par | decide mudanças de alto risco (seção 8) |

Prazo de resposta a Pull Requests: até 3 dias úteis.

## 3. Repositório, ambientes e branches

### 3.1 Repositório
GitHub **público** em `https://github.com/Enzo-Camelo/GameTracker`. Precisa estar acessível
para as verificações: Actions, aprovação de deploy em Environments e Dependabot (no plano
gratuito só funcionam em repositório público) e a conferência pelo professor.

### 3.2 Ambientes

| Environment | Configuração |
|---|---|
| `staging` | deploy automático após merge na `main`; somente branches protegidas |
| `production` | **Required reviewers: Enzo-Camelo**; somente branches protegidas |

### 3.3 Branching e merge
- Trunk-based: `main` é a única branch de longa vida e está sempre protegida.
- Branches curtas: `feature/<issue>-<descricao>`, `fix/<issue>-<descricao>`, `chore/<descricao>`.
- **Proteção da `main`:** PR obrigatório, 1 aprovação de outra pessoa, aprovações antigas
  descartadas a cada novo commit, histórico linear, sem bypass (inclusive administradores),
  sem force-push e sem exclusão.
- **Merge somente por squash**, com o título do PR como mensagem do commit.
- Push direto na `main` é recusado — evidência em [evidencias/README.md](evidencias/README.md).

## 4. Itens de configuração

### 4.1 Lista

| Item | Onde |
|---|---|
| Código-fonte do app | `lib/`, `assets/`, `android/ ios/ web/ linux/ macos/ windows/` |
| Testes | `test/` |
| Dependências (versões exatas) | `pubspec.yaml`, `pubspec.lock` |
| Pipelines (CI/CD) | `.github/workflows/` |
| Automação de dependências | `.github/dependabot.yml` |
| Regras de colaboração | `.github/CODEOWNERS`, `.github/pull_request_template.md`, `.github/ISSUE_TEMPLATE/` |
| Normas do repositório | `.gitignore`, `.gitattributes`, `.env.example`, `analysis_options.yaml` |
| Documentação | `README.md`, `docs/` (inclui **este plano**) |

Segredos **nunca** entram no repositório: use variáveis locais (`.env`, ignorado) e GitHub
Secrets no pipeline. Se um segredo vazar, troque-o na origem (o histórico o preserva).

### 4.2 Convenções
- Commits e títulos de PR em Conventional Commits: `tipo(escopo): descrição`
  (`feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`).
- Versionamento SemVer (`version` no `pubspec.yaml`): `feat` → MINOR, `fix` → PATCH, `!` → MAJOR.
- Baselines: tags `vX.Y.Z` (Aula 3).

## 5. Integração Contínua

Hoje (`.github/workflows/ci.yml`): `flutter pub get` → `flutter analyze` → `flutter test` →
`flutter build apk --debug`, em todo PR para a `main` e em push na `main`.
Cada PR deve ser pequeno, tratar de um assunto, ter testes e ser revisado via CODEOWNERS.
Tornar o check do CI obrigatório na proteção da `main` e validar o título do PR são entregas
da Aula 2.

## 6. Entrega Contínua (Aula 3)

`release.yml` gera o APK de release como artefato a cada merge na `main`. A promoção
staging → production, com aprovação no Environment `production`, tag e Release, será
implementada na Aula 3. Rollback: reexecutar o release da tag anterior.

## 7. Rastreabilidade

Todo PR referencia uma Issue (`Closes #n`); a `main` tem um commit por PR (squash) com
título padronizado; a aprovação fica registrada no PR.

## 8. Controle de mudanças

- Mudança normal: Issue → branch → PR → CI verde → aprovação do par → squash merge.
- **Alto risco (CCM):** dados pessoais (LGPD), assinatura/`applicationId` do app, hotfix
  direto em produção. Abrir Issue com o template "Mudança de alto risco" contendo plano de
  rollback; a decisão do CCM é registrada nos comentários.

## 9. Dependências

Dependabot semanal (`pub`), lockfile versionado e alertas de segurança ativados.

## 10. Revisão deste plano

Revisado ao fim de cada aula ou quando o processo mudar; alterações por PR.
