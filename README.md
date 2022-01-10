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

## Configuration

The script accepts arguments:

```
usage: hook.bash [options] COMMIT-MESSAGE-FILE

  -s --scopes  Colon-separated allowed scope patterns
               Default: .+
     --no-allow-scope  Disallow scope
     --require-scope   Require scope

  -t --types  Colon-separated additional type patterns
              Default: build:chore:ci:docs:feat:fix:perf:refactor:revert:style:test
     --no-default-types  Omit default types

     --debug  Enable debug output
```

These arguments can be passed through `.pre-commit-config.yaml`, for example:

```yaml
repos:
  - repo: https://github.com/agriffis/pre-commit-conventional
    rev: v1.0.0
    hooks:
      - id: conventional-commit
        args: [--require-scope, --scopes, foo:bar:baz]
```
