# Getting Started

## 1) Requisitos locais
- macOS com Xcode (para iOS) e Android Studio/SDKs (para Android).
- Python 3.x e `pip`.
- Ruby + Bundler (para Fastlane) e Git.

## 2) Instalar as ferramentas de docs
```bash
pip install mkdocs-material mike
```

## 3) Clonar e servir (docs)
```bash
git clone <seu-repo-docs>.git
cd <seu-repo-docs>
mkdocs serve
# http://127.0.0.1:8000
```

## 4) Publicar as docs (GitHub Pages)
```bash
mkdocs gh-deploy
```

## 5) Checklist rápido do app
- [ ] Contas: App Store Connect + Play Console
- [ ] Keystore (Upload Key) & Play App Signing habilitado
- [ ] Team iOS configurado / Certificados via *match*
- [ ] `GoogleService-Info.plist` / `google-services.json` guardados como *secrets*

