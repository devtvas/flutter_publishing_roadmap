# CI/CD Guide (GitHub Actions)

```yaml
name: release
on:
  workflow_dispatch:
    inputs:
      platform:
        description: 'ios|android'
        required: true
        default: 'android'

jobs:
  build_release:
    runs-on: macos-14
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with: { flutter-version: 'stable' }
      - name: Install Ruby & Bundler
        run: |
          gem install bundler:2.5.9
          bundle install
      - name: Decrypt secrets (ex.: match repo, keystore)
        run: ./scripts/decrypt_secrets.sh
      - name: Pub get
        run: flutter pub get
      - name: Android lane
        if: ${{ inputs.platform == 'android' }}
        run: bundle exec fastlane android release
        env:
          SUPPLY_JSON_KEY_DATA: ${{ secrets.GPLAY_SERVICE_ACCOUNT_JSON }}
      - name: iOS lane
        if: ${{ inputs.platform == 'ios' }}
        run: bundle exec fastlane ios release
        env:
          APP_STORE_CONNECT_API_KEY: ${{ secrets.ASC_API_KEY_JSON }}
```

!!! warning "Segurança"
    Guarde `*.keystore`, `GoogleService-Info.plist`, `google-services.json`, perfis/certificados (match) como **secrets**. Nunca *commitar*.

