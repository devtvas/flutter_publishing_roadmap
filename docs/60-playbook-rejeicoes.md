# Playbook de Rejeições

## iOS – Causas comuns & Ações
- **2.1 – App Completeness**: falta conta de teste, fluxo quebrado.
  - *Ação*: anexe **credenciais de teste**, vídeo curto e instruções.
- **2.3 – Metadata**: screenshots prometem algo que o app não tem.
  - *Ação*: alinhar screenshots/descrição ao app real.
- **5.1 – Privacidade**: coleta não declarada; uso de Required Reason APIs.
  - *Ação*: atualizar App Privacy e **Privacy Manifest**; explicar propósito in‑app.
- **3.1 – Pagamentos**: paywall/link externo sem IAP quando obrigatório.
  - *Ação*: adequar o fluxo (IAP ou elegibilidade para link externo conforme política).

## Android – Causas comuns & Ações
- **User Data / Data safety** inconsistente com SDKs.
  - *Ação*: revisar SDKs e atualizar formulário + política de privacidade.
- **Permissões sensíveis** (localização/foreground/background).
  - *Ação*: solicitar apenas quando necessário e com justificativa in‑app.
- **Deceptive behavior / Metadata** (palavras‑chave enganosas).
  - *Ação*: limpar *listing* e manter foco/coerência.

> Sempre responda objetivamente, eduque o revisor e **anexe evidências** (vídeo, capturas, logs).

