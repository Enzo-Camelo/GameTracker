# Evidências da Aula 1

Preencha após configurar a proteção da `main`.

## 1. Recusa do push direto na `main`

Comandos executados (em um clone, na branch `main`):

```
git switch main
git commit --allow-empty -m "teste: push direto na main"
git push origin main
```

Saída obtida (cole o texto; deve conter `protected branch` / `GH006`):

```
remote: error: GH006: Protected branch update failed for refs/heads/main.
remote:
remote: - Changes must be made through a pull request.
To https://github.com/Enzo-Camelo/GameTracker.git
 ! [remote rejected] main -> main (protected branch hook declined)
error: failed to push some refs to 'https://github.com/Enzo-Camelo/GameTracker.git'
```

Executado em 2026-10-27. Depois do teste: `git reset --hard origin/main`.

## 2. Par de revisão

- Usuário do par: `@camelo-dev`, permissão *Write* (Settings → Collaborators)
- Convite aceito em: pendente (aguardando aceite de @camelo-dev)

## 3. Prints opcionais

- Settings → Branches (regra da `main`)
- Settings → Environments (`staging` e `production` com revisor)
- Settings → General → Pull Requests (somente squash)
