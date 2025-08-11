# Snippets úteis

## Bump de versão (Dart)
```dart
// tool/version.dart
import 'dart:io';
void main(List<String> args){
  // Ex.: dart run tool/version.dart 1.4.0 123
  final v = args[0];
  final b = args[1];
  final pub = File('pubspec.yaml');
  final t = pub.readAsStringSync()
      .replaceAll(RegExp(r'version: .*'), 'version: $v+$b');
  pub.writeAsStringSync(t);
}
```

## ExportOptions.plist (iOS)
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>method</key><string>app-store</string>
  <key>compileBitcode</key><false/>
  <key>destination</key><string>export</string>
  <key>manageAppVersionAndBuildNumber</key><true/>
</dict></plist>
```

