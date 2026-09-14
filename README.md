# HDI_4DWP_Filter4DExpressions

A 4D v16 **HDI** (How Do I) binary database converted to a 4D project using 4D 21. The codebase was then updated and cleaned up with the help of **GitHub Copilot**.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernised (see below) with the help of **GitHub Copilot**.

- **Blog post:** https://blog.4d.com/protection-4dwp-expressions_eval/

- **Original download:** https://download.4d.com/Demos/4D_v16/HDI_4DWP_Filter4DExpressions.zip

## Overview

This example demonstrates how to **restrict which 4D commands and project methods can be evaluated as live expressions inside a 4D Write Pro area**. The demo form (`HDI2`) hosts a "Demo" 4D Write Pro document, pre-loaded with an Argentina country record, and an "Infos" tab explaining the feature. Buttons insert sample expressions into the document as **structured text (`ST`) expressions**, and `SET ALLOWED METHODS` governs whether a given project method is permitted to actually execute when the expression is evaluated — 4D commands are always evaluable, but only project methods on the allow-list are.

## Features

- **Insert expressions** into the 4D Write Pro document as live, re-evaluatable structured-text ranges (`ST INSERT EXPRESSION`):
  - `Current date` — an always-allowed 4D command.
  - `aMethod` — a project method that is **not** on the allow-list (forbidden).
  - `myMethod` — a project method explicitly added to the allow-list (`SET ALLOWED METHODS`), so it **is** permitted.
  - `QUIT 4D` — a 4D command that is deliberately **forbidden** from evaluation for safety, regardless of the allow-list.
  - A free-form expression built with the 4D **Formula Editor** (`EDIT FORMULA`), so you can try your own commands/methods.
- **Toggle expression display mode** between showing the underlying **reference** (the formula text itself) and the evaluated **value** (`ST SET OPTIONS` with `ST Expressions display mode`).
- **Live country data**, loaded from a bundled `Countries` table (populated on first run from `CountryFacts.xml` via `CreateCountries`) and mirrored on the `Input`/`Output` table forms.
- A splash screen with a 4D Write Pro license check before the demo form opens.

## Points of Interest

The codebase has been modernised end to end as a reference for current 4D project-mode conventions:

- **Localisation** — all user-facing strings (menus, form labels, prompts) are resolved via `:xliff:` references / `Localized string(...)`, with English and Japanese XLIFF resources under `Resources/*.lproj/`.
- **Modern language syntax** — legacy `C_*` declarations replaced with `var`/`#DECLARE` throughout, including the return-value and parameter syntax of every project method and object method.
- **Menu standard actions** — the Quit menu item uses the built-in `"action": "quit"` instead of a one-line wrapper method (the former `m_Quit` method was removed).
- **Method visibility** — subroutines and form-event handlers (`HDI_Init`, `FindCountries`) are marked `"invisible":true` so only true entry points show up in the Run Method dialog.
- **Startup pattern** — the splash window is opened via `CALL WORKER` + non-blocking `DIALOG(...;*)` with window-reuse detection, replacing the older `New process`-based approach; state (e.g. the quit flag) is carried on `Form` rather than in interprocess variables.
- **Dark mode & Liquid Glass** — `styleSheets.css` / `styleSheets_mac.css` adapt colors to light/dark mode (`"automatic"` fills/strokes) and give buttons the correct height for macOS Tahoe's Liquid Glass appearance.
- **Mobile-published method** — `FindCountries` is exposed with `published4DMobile`, letting it be called as a 4D Mobile data-class method independently of the desktop UI.

## Project Structure

```
Project/Sources/
  Methods/
    00_Start.4dm           Application entry point / splash window management
    CreateCountries.4dm    Seeds the Countries table from CountryFacts.xml (run once, standalone)
    FindCountries.4dm      4D Mobile-published lookup method (invisible subroutine)
    HDI_Init.4dm           Loads the Write Pro documents and configures the allow-list (invisible subroutine)
    aMethod.4dm            Sample "forbidden" project method
    myMethod.4dm           Sample "allowed" project method (added via SET ALLOWED METHODS)
  Forms/HDI/                Splash screen; its BtnDemo object method opens the main demo form
  Forms/HDI2/                Main demo form: Infos/Demo tabs, expression-insert buttons, display-mode radio buttons
  TableForms/1/Input, Output  Data entry/read-only forms for the Countries table
Resources/
  en.lproj/, ja.lproj/       XLIFF localisation (English source, Japanese target)
```

## References

- [`ST INSERT EXPRESSION`](https://developer.4d.com/docs/commands/st-insert-expression)
- [`SET ALLOWED METHODS`](https://developer.4d.com/docs/commands/set-allowed-methods)
- [`ST SET OPTIONS`](https://developer.4d.com/docs/commands/st-set-options)
- [`EDIT FORMULA`](https://developer.4d.com/docs/commands/edit-formula)
- [4D Write Pro structured text (ST) expressions](https://developer.4d.com/docs/WritePro/wp-overview)
