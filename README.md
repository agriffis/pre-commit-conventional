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

Your developers will also need to install the `commit-msg` hook since it's not
installed by default (only the `pre-commit` hook is installed by default):

```
pre-commit install -t commit-msg
```

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

## FAQ

### Why is hook.bash so big?

The main part of the script is ~100 lines at the top. The rest is the options
parser, see [ghettopt](https://github.com/agriffis/ghettopt)

### Does this depend on JavaScript?

The reason for `package.json` and related files is to power
[semantic-release](https://github.com/semantic-release/semantic-release). The
hook itself is just bash and grep.
