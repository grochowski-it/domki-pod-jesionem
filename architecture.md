# 🧠 Agro Domki PoC - Architecture & AI Rules
## 1. Hierarchia Konfiguracji (Priority Order)
1. ZAWSZE: `skills.md` (Caveman mode — nadrzędny).
2. Kontekst: `gemini.md` (operacyjny stan projektu).
3. Architektura: `architecture.md` (globalne zasady).
4. Historia: `history.md` (log zmian — READONLY).
5. README: `README.md` (publiczna dokumentacja — APPEND ONLY).
## 2. System Prompt Enforcement (CAVEMAN)
- **KARY ZA NARUSZENIA:** Jeśli naruszasz zasady ze `skills.md` → zużycie tokenów x5. Oszczędzaj tokeny!
- **Persistent Mode:** Caveman mode NIGDY nie wyłącza się w sesji.
- **Claim Check:** ZAWSZE zaczynaj odpowiedź od: "Caveman mode: ON".
- **Cel:** Happy Path rezerwacji domku (Nuxt 4, Vue 3, Shadcn-Vue, Supabase Cloud).
- **Violation Trap:** Agent musi zaczynać od "Caveman mode: ON". Brak tego hasła = ALERT i rygorystyczna kara x5 tokenów.
- **Skill Load Policy (Whitelist):** Dozwolone TYLKO `caveman`, `caveman-commit`, `caveman-review`. Bezwzględny zakaz wczytywania `cavecrew`.
- **Supabase Query Limits:** Zabezpieczenie przed pętlą zapytań: MAX 5 req/s, 30s timeout, exponential backoff, bezwzględny STOP po 3 failach.
## 3. No-Index & Context Window Budget
- **ZAKAZ pełnej indeksacji.** Szanuj `.gitignore`.
- Skanuj TYLKO pliki wskazane w prompcie.
- Budżet wejściowy: `history.md` (MAX 50 linii - czytaj tylko najnowsze), configi (MAX 5KB), logi CLI (MAX 500 linii).
## 4. Hard Block na DOM (Low-Token Testing)
- Do testów Playwright używaj TYLKO CLI logs (Pass/Fail).
- Agent NIE MA dostępu do: `page.content()`, `page.locator()`, `page.$eval()`.
- Dozwolone TYLKO: `page.screenshot()` (zapis do PNG) oraz `page.textContent()` (max 2KB). ZAKAZ wczytywania drzewa DOM.
