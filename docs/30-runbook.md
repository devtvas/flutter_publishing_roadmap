# Runbook — Release manual

## Android
```bash
# 1) Atualize versão no pubspec.yaml
flutter pub get
# 2) Build
flutter build appbundle --flavor prod --target lib/main_prod.dart --release
# 3) Opcional: Internal App Sharing
# ./gradlew :app:uploadInternalSharingBundle
```
- Play Console → escolha a *track* (internal/closed/open/prod), defina *rollout* gradual e notas.

## iOS
```bash
# 1) Preparar pods
cd ios && bundle exec pod install && cd ..
# 2) Build IPA
flutter build ipa --flavor prod --release \
  --export-options-plist=ios/ExportOptions.plist
# 3) Alternativa: Xcode (Archive → Distribute → App Store Connect)
```
- App Store Connect → crie a build, preencha metadados, **App Privacy** e envie para revisão.

