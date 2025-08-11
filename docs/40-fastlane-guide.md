# Fastlane Guide

## Estrutura sugerida
```
fastlane/
  Appfile
  Fastfile
  Deliverfile (iOS) / Supplyfile (Android)
  metadata/ (descrições, keywords, release notes)
```

## Fastfile (exemplo resumido)
```ruby
default_platform(:ios)

platform :ios do
  lane :match_setup do
    match(type: "appstore", readonly: false)
  end

  lane :beta do
    match(type: "appstore")
    gym(scheme: "Runner-prod", export_method: "app-store")
    pilot(skip_waiting_for_build_processing: true)
  end

  lane :release do
    match(type: "appstore")
    gym(scheme: "Runner-prod", export_method: "app-store")
    deliver(submit_for_review: true, force: true)
  end
end

platform :android do
  lane :beta do
    gradle(task: "bundle", build_type: "Release", flavor: "prod")
    supply(track: "internal",
           aab: "app/build/outputs/bundle/prodRelease/app-prod-release.aab")
  end

  lane :release do
    gradle(task: "bundle", build_type: "Release", flavor: "prod")
    supply(track: "production", rollout: 0.1,
           aab: "app/build/outputs/bundle/prodRelease/app-prod-release.aab")
  end
end
```

## Screenshots automatizados
- iOS: `snapshot` com *UI tests* → gera screenshots por idioma/dispositivo.
- Android: `screengrab` via Espresso → captura por resolução.
- Use `frameit` para emoldurar.

