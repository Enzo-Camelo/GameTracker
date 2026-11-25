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
| `staging` | deploy automático após merge `feat`/`fix` na `main` (`cd.yml`); somente branches protegidas |
| `production` | **Required reviewers: Enzo-Camelo**; somente branches protegidas; usado pelo `cd.yml` e pelo `rollback.yml` |

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
- Baselines: tags `vX.Y.Z` criadas pelo `cd.yml`. A tag é a fonte da versão: o
  `version` do `pubspec.yaml` fica como base e o build recebe `--build-name` da tag.

## 5. Integração Contínua

Hoje (`.github/workflows/ci.yml`): `flutter pub get` → `flutter analyze` → `flutter test` →
`flutter build apk --debug`, em todo PR para a `main` e em push na `main`.
Cada PR deve ser pequeno, tratar de um assunto, ter testes e ser revisado via CODEOWNERS.
Tornar o check do CI obrigatório na proteção da `main` e validar o título do PR são entregas
da Aula 2.

## 6. Entrega Contínua

### 6.1 Pipeline (`.github/workflows/cd.yml`)
A cada push na `main` (merge por squash), o job `versao` lê o título do commit:
`feat` → MINOR, `fix` → PATCH, `tipo!:` → MAJOR; outros tipos não geram baseline.
Em seguida: `staging` (testes + APK de release como artefato) → `production`
(**aprovação obrigatória** de @Enzo-Camelo) → tag `vX.Y.Z` no commit da `main` e Release
com o APK, marcada como *Latest*. O `workflow_dispatch` existe só para a baseline inicial.

### 6.2 Rollback (`.github/workflows/rollback.yml`)
Actions → Rollback → Run workflow, informando a tag. Também exige aprovação em
`production`; reimplanta o APK daquela Release e a marca como *Latest*. Não altera a `main`:
a correção do defeito segue o fluxo normal (Issue → `fix/...` → PR → nova baseline PATCH).
Todo rollback é registrado numa Issue de incidente (seção 8).

## 7. Rastreabilidade

Todo PR referencia uma Issue (`Closes #n`); a `main` tem um commit por PR (squash) com
título padronizado; a aprovação fica registrada no PR.

## 8. Controle de mudanças

- Mudança normal: Issue → branch → PR → CI verde → aprovação do par → squash merge.
- **Alto risco (CCM):** dados pessoais (LGPD), assinatura/`applicationId` do app, hotfix
  direto em produção. Abrir Issue com o template "Mudança de alto risco" contendo plano de
  rollback; a decisão do CCM é registrada nos comentários.
- **Incidente em produção:** rollback pelo `rollback.yml` (seção 6.2) e Issue de incidente
  com defeito, versão afetada, tag de destino, quem aprovou e plano de correção da `main`.

## 9. Dependências

Dependabot semanal (`pub`), lockfile versionado e alertas de segurança ativados.

## 10. Revisão deste plano

Revisado ao fim de cada aula ou quando o processo mudar; alterações por PR.
