# Flutter Publishing Specialist — Docs

Este repositório contém a documentação **sequencial** (00 → 98) para publicação Flutter (Android/iOS) no formato **MkDocs Material**.

## ⚡ Getting Started
```bash
pip install mkdocs-material mike
mkdocs serve
# http://127.0.0.1:8000
```

## 🚀 Publicar Docs (GitHub Pages)
1. Habilite *Pages* no repositório (branch `gh-pages`).  
2. Faça *commit* do conteúdo e rode localmente:
   ```bash
   mkdocs gh-deploy
   ```
   ou use o workflow `.github/workflows/docs.yml` (ver abaixo).

## 🧩 Personalização rápida (placeholders)
Nas docs você verá placeholders como:
- `com.your.app` (Bundle ID / ApplicationId)
- `Your App` (nome do app)
- `clientA`, `clientB` (marcas/flavors)
- `prod`, `dev`, `stg` (ambientes)

Você pode **substituir automaticamente** com o script abaixo.

## 🛠️ Personalize (automático)
Edite os valores e execute:

```bash
bash bin/personalize.sh   --app-name "Seu App"   --bundle-android "com.seu.app"   --bundle-ios "com.seu.app"   --track "internal"   --rollout "0.1"
```

### Parâmetros suportados
- `--app-name` → Nome de exibição (docs)
- `--bundle-android` → `applicationId` Android
- `--bundle-ios` → `PRODUCT_BUNDLE_IDENTIFIER` iOS
- `--track` → *internal|closed|open|production* (usado nas instruções)
- `--rollout` → fração inicial (ex.: `0.1` = 10%)

> O script faz *search & replace* nos `.md` e no `mkdocs.yml` quando aplicável. Sem efeitos no seu código do app — é só documentação.

## 🔐 Secrets & Segurança (referência)
- **Play Console**: `GPLAY_SERVICE_ACCOUNT_JSON`
- **App Store Connect**: `ASC_API_KEY_JSON` (chave API ASC)
- **Android**: `*.keystore` (Upload Key) guardado no CI
- **Firebase**: `google-services.json` / `GoogleService-Info.plist` como *secret* ou artefato criptografado

## 🧪 Docs CI (opcional)
O workflow `docs.yml` compila e publica as docs em `gh-pages` a cada *push* na branch `main` (pode alterar).