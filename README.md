# case.dev Claude Skills

Claude Skills that integrate [case.dev](https://case.dev) into Claude agents via the `casedev` CLI.

## Skills

| Skill | What it does |
|---|---|
| **setup** | Install CLI, authenticate, diagnostics, focus targets, job tracker, API routes, raw API access |
| **vaults** | Encrypted document vaults: create, upload files/directories, download, list objects, semantic search |
| **ocr** | Document OCR: process PDFs and images, check status, word-level positional data |
| **transcription** | Audio/video transcription: speaker diarization, status tracking, result retrieval |
| **search** | Web, legal authorities, case law (query + similarity), patents, vault semantic, skills KB |

## Install

### Claude.ai

1. Download or clone this repo
2. Zip each skill folder individually (e.g., `setup/`, `vaults/`)
3. Upload via **Settings > Capabilities > Skills**

### Claude Code

Copy skill folders into your Claude Code skills directory:

```bash
cp -r setup ~/.claude/skills/setup
cp -r vaults ~/.claude/skills/vaults
cp -r ocr ~/.claude/skills/ocr
cp -r transcription ~/.claude/skills/transcription
cp -r search ~/.claude/skills/search
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

Or run the bundled setup script:
```bash
bash setup/scripts/setup.sh
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
legal-plugin/
├── README.md
├── setup/
│   ├── SKILL.md
│   └── scripts/
│       └── setup.sh
├── vaults/
│   └── SKILL.md
├── ocr/
│   └── SKILL.md
├── transcription/
│   └── SKILL.md
└── search/
    └── SKILL.md
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
