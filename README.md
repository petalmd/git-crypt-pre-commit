# Git-crypt pre-commit

Pre-commit hook to avoid accidentally adding unencrypted files with [git-crypt](https://www.agwa.name/projects/git-crypt/).

```bash
- repo: https://github.com/petalmd/git-crypt-pre-commit
  rev: ''  # Use the revision rev you want to point at
  hooks:
  - id: git-crypt
````
