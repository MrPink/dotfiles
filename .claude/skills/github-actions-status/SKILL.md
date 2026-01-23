---
name: github-actions-status
description: |
  Tool for fetching the status and details of GitHub Actions workflow runs.
  The skill uses the GitHub CLI (gh) to retrieve run information, allowing
  you to check the status, duration, and associated commit or pull request.
  Example usage: "Check the status of the latest 'ci.yml' workflow run"
  or "What's the status for run ID 12345678?"
---

# GitHub Action Run Status Skill

You have the ability to run shell commands using the `Bash` tool. You must use the **GitHub CLI (`gh`)** for all interactions with GitHub Actions.

## **Execution Plan:**

1.  **Analyze the User Request:** Determine if the user is asking for:
    * The **latest run** of a specific workflow file (e.g., `ci.yml`).
    * A run by its specific **ID**.
2.  **Determine the Correct `gh` Command:**
    * **To find the latest run of a workflow (e.g., `ci.yml`):**
        ```bash
        gh run list --workflow 'ci.yml' --limit 1 --json databaseId,status,conclusion,name,url,event,headBranch | jq '.[0]'
        ```
    * **To find a run by ID (e.g., `12345678`):**
        ```bash
        gh run view 12345678 --json databaseId,status,conclusion,name,url,event,headBranch | jq
        ```
    * **Crucial Note:** You must always include the `--repo` flag if a repository is mentioned, e.g., `gh run list --repo owner/repo ...`. If no repository is mentioned, assume the current working directory's repository.
    * **Output Formatting:** Use the `--json` flag to get a clean JSON object and pipe it to `jq` for pretty-printing, making it easy for you to parse and summarize.
3.  **Execute the Command:** Use the `Bash` tool to run the generated `gh` command.
4.  **Synthesize the Output:** Read the JSON output and provide a clear, concise, and human-readable summary of the Action run's status, conclusion (if complete), branch, and a direct URL to the run.

## **Tooling and Constraints:**

* **Allowed Tool:** `Bash` (specifically for `gh run` commands and `jq`).
* **Mandatory Requirement:** The user must have the GitHub CLI (`gh`) installed and authenticated on the system where Claude Code is running. **If `gh` is not found, or the command fails, you must inform the user about the failure and the dependency on the GitHub CLI.**
* **Goal:** Provide the most relevant information about the run in an easy-to-digest format.

## **Example Prompts:**

* *User:* "What is the status of the last run of my deploy-to-prod workflow?"
* *User:* "Can you give me the details for GitHub Action run 98765432?"
* *User:* "Check the status of the 'build-test.yml' workflow in the `anthropic/claude-repo`."
