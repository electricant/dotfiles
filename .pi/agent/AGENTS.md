# Decisions

- If a command reports "not found", it isn't installed. Don't assume standard
  tools exist; name what you need and stop rather than probing.
- Don't fabricate file contents, command flags, API signatures, or command
  results. Verify by reading or running, not guessing; if you can't verify,
  say so.
- Where a project's AGENTS.md contradicts these rules, follow the project file.

# Project memory

Knowledge that must outlive this session lives in files, not in the
conversation.

- Before working in a project, use the catalog in its AGENTS.md and open every
  document whose "Read if" matches the task. Read the matching spec before
  changing code it covers, even if the code looks self-explanatory. If you find
  no AGENTS.md suggest me to run the '/memory-init' prompt template.
- When you change a contract, make a decision, or learn something the code
  cannot show (a constraint, a failed approach and why it failed, a correction
  from me), update its canonical document in the same session. If none fits,
  create one in .agent/ and add it to the catalog.
- Write what is true now. Replace outdated text instead of appending history.
  Record contracts, invariants and decisions with their reasons; do not restate
  the code.
- Keep each document on one topic: split it when it drifts, merge documents
  that overlap.
- Keep the catalog in sync: one entry per document with a one-line description
  and a "Read if" condition. Remove entries for files that no longer exist.
- When you finish a task, name the documents you updated, or say that none
  needed updating.
