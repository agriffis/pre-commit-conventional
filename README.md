# pre-commit-conventional

[![tests workflow](https://github.com/agriffis/pre-commit-conventional/actions/workflows/tests.yml/badge.svg)](https://github.com/agriffis/pre-commit-conventional/actions/workflows/tests.yml) [![pre-commit.ci status](https://results.pre-commit.ci/badge/github/agriffis/pre-commit-conventional/main.svg)](https://results.pre-commit.ci/latest/github/agriffis/pre-commit-conventional/main)

[pre-commit](https://pre-commit.com/) hook to check commit message for
conformance to [Conventional Commits](https://www.conventionalcommits.org/).

## Usage

Add to your `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: https://github.com/agriffis/pre-commit-conventional
    rev: v1.0.0
    hooks:
      - id: conventional-commit
```

This project dogfoods itself, so you can also look at our
[.pre-commit-config.yaml](https://github.com/agriffis/pre-commit-conventional/blob/main/.pre-commit-config.yaml)

