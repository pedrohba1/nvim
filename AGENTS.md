AGENTS.md for the Neovim config repo
**Build, Lint, and Tests**
- **Single-test**: run a focused test with the repository's test harness (where present).
- **Install plugins**: `nvim --headless +LazyInstall +qa`
- **Update plugins**: `nvim --headless +LazyUpdate +qa`
- **Lint/Format**: `stylua --check lua/` and `stylua lua/...` to fix
- **Repository health**: ensure `stylua.toml` is present and obeyed
**Code Style**
- **Imports**: use `local`, order: standard libs, then 3rd party, then local
- **Formatting**: follow stylua; consistent indent; no trailing spaces
- **Types/docs**: Lua is dynamic; add LuaDoc comments where possible
- **Naming**: follow existing patterns; use snake_case for locals/functions; module names in PascalCase; file names align
- **Error handling**: use pcall where necessary; propagate clear errors
- **Testing**: add tests for new modules if present; follow project conventions
- **Version control**: small commits; explain why, not just what
**Rules**
- Cursor rules: none found
- Copilot rules: none found
- If rules exist, embed them in this file
End of AGENTS.md