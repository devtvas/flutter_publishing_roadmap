# Estrutura White‑label & Schemes

## Android (flavors)

### `android/app/build.gradle` (trecho)
```gradle
android {
  defaultConfig {
    applicationId "com.your.app"
    versionCode flutterVersionCode.toInteger()
    versionName flutterVersionName
  }

  flavorDimensions "brand"
  productFlavors {
    prod {
      dimension "brand"
      applicationId "com.your.app"
    }
    clientA {
      dimension "brand"
      applicationId "com.clientA.app"
      resValue "string", "app_name", "ClientA"
    }
    clientB {
      dimension "brand"
      applicationId "com.clientB.app"
      resValue "string", "app_name", "ClientB"
    }
  }

  buildTypes {
    release {
      // signingConfigs.release configurado via keystore OU Play App Signing
      minifyEnabled true
      shrinkResources true
      proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
  }
}
```

### Keystore (quando necessário)
```bash
keytool -genkey -v \
 -keystore app-upload.keystore -alias upload \
 -keyalg RSA -keysize 2048 -validity 10000
```
> Use **Upload Key** local e habilite **Play App Signing**. Guarde o `.keystore` como secret no CI.

---

## iOS (schemes + xcconfigs)

1. Crie **Schemes**: `Runner-prod`, `Runner-clientA`, `Runner-clientB`.
2. Em `ios/` adicione `Configs/Prod.xcconfig`, `Configs/ClientA.xcconfig`:
```xcconfig
PRODUCT_BUNDLE_IDENTIFIER = com.your.app
DISPLAY_NAME = Your App
```
3. Duplique ícones por *target* (AppIcon-prod, AppIcon-clientA…).  
4. **Signing**: automático com *team* correto ou via **Fastlane Match**.

