# 🧠 Agro Domki PoC - Architecture & AI Rules

## 1. Cel Projektu (PoC)
Absolutne minimum (Happy Path): Rezerwacja wolnego terminu w domku. Skupienie na przepływie danych.

## 2. Stos Technologiczny
*   Frontend: Nuxt 4, Vue 3, TypeScript, Shadcn-Vue.
*   Backend/DB: Supabase (Cloud). Cała logika backendowa TYLKO na Supabase.

## 3. Żelazne Zasady (AI Agents)
1.  **WYMÓG KRYTYCZNY (CAVEMAN SKILLS):** Literalnie ZAWSZE, przed wygenerowaniem jakiejkolwiek odpowiedzi lub kodu, MUSISZ przeczytać plik `skills.md`. Zawiera on bezwzględne zasady komunikacji "Caveman" z repozytorium JuliusBrussee, których musisz rygorystycznie przestrzegać, aby minimalizować zużycie tokenów.
2.  **No-Index & Zmienne:** ZAKAZ pełnej indeksacji katalogu. Skanuj TYLKO pliki wskazane w prompcie oraz `skills.md`. Zawsze sprawdzaj i respektuj `.gitignore`. Zmienne środowiskowe pobieraj samodzielnie z pliku `.env`.
3.  **Źródło Prawdy:** Przed pracą czytaj `gemini.md` po kontekst operacyjny.
4.  **Ciągłość (history.md & README.md):** Każda zmiana MUSI być dodana na końcu `history.md` z timestampem. Nowe funkcjonalności dopisuj na końcu `README.md`. NIGDY nie nadpisuj tych plików bez wyraźnego rozkazu.
5.  **Low-Token Testing:** Do testów UI używaj Playwright (Visual Regression: `expect(page).toHaveScreenshot()`). Czytaj tylko logi w CLI (Pass/Fail). ZAKAZ wczytywania całego DOM.
