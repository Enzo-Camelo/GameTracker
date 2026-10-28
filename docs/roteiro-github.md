# Roteiro de configuração no GitHub (Aula 1)

Tudo o que não é arquivo do repositório e precisa ser feito pela interface do GitHub.
Siga na ordem: **a proteção da `main` (passo 7) só depois de publicar os arquivos (passo 1)**,
senão você mesmo não consegue mais enviar direto.

Repositório: https://github.com/Enzo-Camelo/GameTracker (já público)

## Passo 0 — Pré-requisitos
- [ ] Conta GitHub com e-mail verificado e 2FA ativo (github.com/settings/security).
- [ ] Definido o **par de revisão** (colega) e o usuário GitHub dele. Você também revisa os PRs dele.

## Passo 1 — Publicar os arquivos desta configuração na `main`
A `main` ainda não está protegida, então dá para fazer assim:
1. No terminal: `git push -u origin chore/aula-1-gcs`
2. No GitHub, abra o PR (banner "Compare & pull request") com título
   `docs: adiciona plano de GCS e itens de configuração do repositório`.
3. Aguarde o check do CI ficar verde e faça **Squash and merge** (ainda é permitido).
4. Localmente: `git switch main && git pull`.

## Passo 2 — Ajustar os marcadores
Substitua `<USUARIO-DO-PAR>` em `README.md`, `docs/plano-gcs.md` e `docs/evidencias/README.md`
pelo usuário real do seu par (faça num PR pequeno, após o passo 7, já testando o fluxo).

## Passo 3 — Verificar que o repositório está público/acessível
Settings → General → role até **Danger Zone**. Deve aparecer "Change visibility"
com o repositório **Public**. (Hoje já está público.)

## Passo 4 — Par de revisão com acesso de escrita
1. Settings → **Collaborators** (menu "Access") → **Add people**.
2. Digite o usuário do par → escolha o papel **Write** → Add.
3. O par aceita o convite (e-mail ou github.com/notifications). Sem aceite ele não aprova PRs.
4. Faça o mesmo no repositório dele (ele te adiciona; você aprova os PRs dele).
5. Conferência: Settings → Collaborators mostra o par com **Write**.

## Passo 5 — Merge somente por squash
Settings → General → seção **Pull Requests**:
- [ ] Desmarcar **Allow merge commits**
- [ ] Desmarcar **Allow rebase merging**
- [ ] Manter marcado **Allow squash merging**; em *Default commit message* escolher
      **Pull request title and description**
- [ ] Marcar **Automatically delete head branches**

## Passo 6 — Environments `staging` e `production`
Settings → **Environments** → **New environment**. Crie os dois **antes** de qualquer deploy
(senão o GitHub cria `production` sem aprovação).

**staging**
- Name: `staging` → Configure environment
- *Deployment branches and tags* → **Protected branches only**
- Save protection rules

**production**
- Name: `production` → Configure environment
- Marcar **Required reviewers** → pesquisar e selecionar **você (Enzo-Camelo)** → Save
- **Desmarcar** *Prevent self-review* (você trabalha em equipe de 2 e precisa aprovar o que dispara)
- *Deployment branches and tags* → **Protected branches only**
- Save protection rules

Se "Required reviewers" não aparecer: o repositório está privado (precisa ser público no plano gratuito).

## Passo 7 — Proteção da `main`
Settings → **Branches** → **Add classic branch protection rule** (ou Rulesets, equivalente).
*Branch name pattern*: `main`
- [ ] **Require a pull request before merging**
  - [ ] *Required approvals*: **1**
  - [ ] **Dismiss stale pull request approvals when new commits are pushed**
  - [ ] (recomendado) *Require review from Code Owners*
- [ ] **Require linear history**
- [ ] **Do not allow bypassing the above settings** (vale também para você, administrador)
- [ ] *Allow force pushes* e *Allow deletions*: deixar **desmarcados**
- [ ] *Require status checks to pass*: **deixe para a Aula 2** (depois marque o job
      `build-and-test`; ele só aparece na lista depois de rodar em algum PR)
- Create / Save changes

Obs.: com 1 aprovação obrigatória, só o par consegue aprovar seus PRs. Combine prazo com ele.

## Passo 8 — Evidência da recusa do push direto
No clone local, na `main` atualizada:

```bash
git switch main && git pull
git commit --allow-empty -m "teste: push direto na main"
git push origin main
```

Resultado esperado: `remote: error: GH006: Protected branch update failed for refs/heads/main`
e `! [remote rejected] main -> main (protected branch hook declined)`.
1. Copie esse texto (e/ou tire print) e cole em `docs/evidencias/README.md` (via PR) e no ambiente da disciplina.
2. Desfaça o commit de teste: `git reset --hard origin/main`.
3. Tente também pelo site (*Edit file → Commit directly to main*): o GitHub deve bloquear.

## Passo 9 — Ativos recomendados (segurança)
Settings → **Code security**: ativar **Dependabot alerts** e **Dependabot security updates**.
O arquivo `.github/dependabot.yml` (corrigido nesta entrega — antes estava com nome `.dependabot.yml`,
que o GitHub ignora) cuida das atualizações de versão.

## Passo 10 — Entrega (enviar no ambiente da disciplina)
1. Link do repositório: https://github.com/Enzo-Camelo/GameTracker
2. Usuário GitHub do par de revisão.
3. Texto/print da recusa do push direto na `main`.

## Checklist final de conferência
- [ ] Repositório público; README permite instalar, rodar e testar
- [ ] `.gitignore`, `.gitattributes`, `pubspec.lock`, `.env.example` no repositório; sem segredos
- [ ] `docs/plano-gcs.md` publicado na `main`
- [ ] Template de PR, CODEOWNERS (com seu usuário) e templates de Issue publicados
- [ ] Par de revisão com acesso **Write** (convite aceito)
- [ ] Somente squash merge, título do PR como mensagem
- [ ] Environments `staging` e `production` (este com você como revisor obrigatório)
- [ ] `main` protegida: PR, 1 aprovação, histórico linear, sem bypass
- [ ] Evidência da recusa do push direto anexada

## Problemas comuns
| Sintoma | Solução |
|---|---|
| Não consigo mais mesclar meu PR | com 1 aprovação, só o par aprova; ele precisa aceitar o convite |
| Check não aparece para selecionar | ele só lista checks que já rodaram; abra um PR e espere o CI |
| Push pede senha e recusa | use HTTPS com o Git Credential Manager (login pelo navegador) |
| Push por SSH trava | porta 22 bloqueada no laboratório: use URL `https://` |
