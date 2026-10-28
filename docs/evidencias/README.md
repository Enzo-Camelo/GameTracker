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
<COLE AQUI>
```

Depois do teste, desfaça o commit local: `git reset --hard origin/main`.

## 2. Par de revisão

- Usuário do par: `@camelo-dev`, permissão *Write* (Settings → Collaborators)
- Convite aceito em: `<data>`

## 3. Prints opcionais

- Settings → Branches (regra da `main`)
- Settings → Environments (`staging` e `production` com revisor)
- Settings → General → Pull Requests (somente squash)
