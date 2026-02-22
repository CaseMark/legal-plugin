# case.dev Claude Skills

Claude Skills that integrate [case.dev](https://case.dev) into Claude agents via the `casedev` CLI.

## Skills

| Skill | What it does |
|---|---|
| **case-dev** | Core setup: install CLI, authenticate, diagnostics, focus targets, job tracker, API routes, raw API access |
| **case-dev-vaults** | Encrypted document vaults: create, upload files/directories, download, list objects, semantic search |
| **case-dev-ocr** | Document OCR: process PDFs and images, check status, word-level positional data |
| **case-dev-transcription** | Audio/video transcription: speaker diarization, status tracking, result retrieval |
| **case-dev-search** | Search: web, legal authorities, case law (query + similarity), patents, vault semantic, skills KB |

## Install

### Claude.ai

1. Download or clone this repo
2. Zip each skill folder individually (e.g., `case-dev/`, `case-dev-vaults/`)
3. Upload via **Settings > Capabilities > Skills**

### Claude Code

Copy skill folders into your Claude Code skills directory:

```bash
cp -r case-dev ~/.claude/skills/case-dev
cp -r case-dev-vaults ~/.claude/skills/case-dev-vaults
cp -r case-dev-ocr ~/.claude/skills/case-dev-ocr
cp -r case-dev-transcription ~/.claude/skills/case-dev-transcription
cp -r case-dev-search ~/.claude/skills/case-dev-search
```

### Claude API

Use the `/v1/skills` endpoint or the `container.skills` parameter in Messages API requests.

## Prerequisites

The skills use the `casedev` CLI binary:

```bash
# macOS
brew install casemark/casedev/casedev

# macOS + Linux
curl -fsSL https://raw.githubusercontent.com/CaseMark/homebrew-casedev/main/install.sh | sh
```

Authenticate with one of:

```bash
export CASE_API_KEY=sk_case_YOUR_KEY           # env var (best for agents)
casedev auth set-key --api-key sk_case_YOUR_KEY # stored in config
casedev auth login --no-open                    # browser device flow
```

Verify: `casedev doctor --json`

## Structure

```
openclaw-casedev/
├── README.md                          # This file (repo-level, not inside skills)
├── case-dev/
│   └── SKILL.md                       # Core setup skill
├── case-dev-vaults/
│   └── SKILL.md                       # Vault operations skill
├── case-dev-ocr/
│   └── SKILL.md                       # OCR skill
├── case-dev-transcription/
│   └── SKILL.md                       # Transcription skill
└── case-dev-search/
    └── SKILL.md                       # Search skill
```

## Usage Examples

Once installed, Claude can:

- "Create a vault for the Smith v. Jones case and upload these discovery documents"
- "OCR this scanned contract and extract the text"
- "Transcribe this deposition recording with speaker labels for 4 participants"
- "Search my vault for documents mentioning force majeure"
- "Find California employment law cases about remote work"
- "Search for machine learning patents filed by Google in 2024"
- "Fetch the content of this court ruling URL"

## Links

- [case.dev](https://case.dev)
- [case.dev Documentation](https://docs.case.dev)
- [case.dev API Reference](https://docs.case.dev/api-reference)
- [casedev CLI Source](https://github.com/CaseMark/casedotdev-mono/tree/main/apps/cli)
- [Claude Skills Best Practices](https://docs.anthropic.com/en/docs/agents-and-tools/agent-skills/best-practices)

## License

MIT
