---
description: Create or refresh this project's agent memory (AGENTS.md map and catalog, .agent/ documents)
argument-hint: "[extra instructions]"
---
Set up or refresh the agent memory for the project in the current directory.
Extra instructions from me: ${@:-none}.

The memory has two parts, both private to me and kept out of git:

- `AGENTS.md` at the repository root. Pi loads it into every request, so keep it
  under about 150 lines. It has three sections: `## Rules`, `## Codebase map`
  and `## Catalog`.
- `.agent/` at the repository root. It holds documents too large or too specific
  to load every time: specs, decisions, research, and detailed maps of large
  areas in `.agent/map/<area>.md`.

## Phase 1: Inspect (read only)

1. Find the repository root with `git rev-parse --show-toplevel` and work from
   there. If this is not a git repository, use the current directory and skip
   every git step below.
2. Look for these files in the root: AGENTS.override.md, AGENTS.md, AGENTS.MD,
   CLAUDE.md, CLAUDE.MD. Pi loads only the first one it finds in a directory,
   in that order. If AGENTS.md exists and git does not track it, this run is a 
   refresh. If an untracked CLAUDE.md exists, carry its content into AGENTS.md
   and leave CLAUDE.md in place.
3. Find existing documentation: READMEs, docs/ folders, design notes, decision
   records, specs, and agent notes such as CONTEXT.md, NOTES.md or memory/
   folders.
4. Survey the layout from directory listings and build manifests (Makefile,
   CMakeLists.txt, package.json, pyproject.toml, flake.nix and similar). Read
   READMEs and obvious entry points. Read other files sparingly: prefer
   directory structure to file contents. Skip generated, vendored and
   build-output trees.
5. Classify the project as new (little code, nothing to migrate) or existing.

## Phase 2: Propose a plan and wait

Show me:

- the sections of the codebase map, and which areas get their own
  `.agent/map/<area>.md` because they are too large for AGENTS.md;
- every existing document you will catalog, and where it stays;
- any untracked notes you propose to move into `.agent/` (never tracked files);
- anything you are unsure about.

Then wait for my approval. Write nothing before I approve.

## Phase 3: Write

1. Before creating any file, add these lines to the file printed by
   `git rev-parse --git-path info/exclude`, creating it if needed and skipping
   lines already present:

   ```
   /AGENTS.md
   /.agent/
   ```

2. `## Codebase map`: start with the line "Paths are relative to the repository
   root." Then write a short architecture paragraph (what the project is, its
   main components, how they connect), then a tree of directories and key
   files, one line each with a concise description. Put similar files on one
   line. Give large or low-value directories a single line without listing
   their files. For an area too large to map here, write `.agent/map/<area>.md`
   in the same style and list it in the catalog.
3. `## Catalog`: start with the same line about paths. Then one line per
   document: its path, a one-line description, and "Read if:" followed by the
   tasks that need it. Catalog tracked documents where they are; never move or
   copy them, because moving a tracked file removes it from the repository for
   everyone else. Move only the untracked notes I approved.
4. `## Rules`: write only what you found, such as build and test commands or
   conventions stated in existing documents. Do not invent rules. On a refresh,
   leave this section unchanged.
5. On a refresh, keep accurate entries, rewrite stale ones, add missing ones,
   and delete entries whose paths no longer exist.

Do the exploration and writing yourself. Do not start background or delegated
agents.

## Phase 4: Verify and report

1. Check that every path in the map and the catalog exists, and that AGENTS.md
   is under about 150 lines.
2. Run `git status --short` and confirm that neither AGENTS.md nor `.agent/`
   appears in it.
3. Report the files you wrote, the documents you cataloged, the notes you moved,
   the coverage you left out on purpose, and anything you could not determine.
   Remind me to run /reload so pi loads the new AGENTS.md.
