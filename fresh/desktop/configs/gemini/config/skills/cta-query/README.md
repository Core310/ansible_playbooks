# cta-query

`cta-query` provides instantaneous, token-efficient RAG querying over `.cta/cta_codebase.db` and `.cta/cta_turns.db`.

## Supported Query Types
- **Symbols**: Exact or fuzzy name matching.
- **FTS5 Search**: High-speed keyword search in AST signatures and docstrings.
- **Tags**: Categorized architecture tags.
- **Call Graph**: Inbound callers and outbound dependencies.
