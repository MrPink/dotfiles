# Claude Code Configuration

This directory contains custom commands, skills, and settings for Claude Code.

## Structure

```
.claude/
├── commands/           # Custom slash commands
├── skills/            # Custom skills
└── settings.local.json # Claude Code permissions
```

## Commands

Commands are markdown files that define custom slash commands you can use with Claude Code.

- **jira-ticket.md** - Create a JIRA ticket from branch changes
- **setup-branch.md** - Create JIRA ticket, branch, and draft PR
- **tf-plan.md** - Run terraform plan and output results

### Usage

```bash
/jira-ticket
/setup-branch "description of work"
/tf-plan
```

## Skills

Skills are more complex capabilities that Claude Code can use autonomously.

### github-actions-status

Tool for fetching and displaying GitHub Actions workflow run status using the GitHub CLI.

**Usage examples:**
- "Check the status of the latest 'ci.yml' workflow run"
- "What's the status for run ID 12345678?"

## Settings

The `settings.local.json` file defines permissions for Claude Code operations:

- **allow** - Tools that can run without asking permission
- **deny** - Tools that are blocked
- **ask** - Tools that require user confirmation

## Installation

These configurations are automatically symlinked to `~/.claude/` when you run:

```bash
./install.sh
```
