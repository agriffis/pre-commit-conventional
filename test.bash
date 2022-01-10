#!/bin/bash

main() {
  fails=0

  # types
  bad <<<''
  bad <<<'feat'
  bad <<<'feat:'
  bad <<<'feat: '
  good <<<'feat: x'
  bad --no-default-types <<<'feat: x'
  good --no-default-types --types feat <<<'feat: x'
  good --no-default-types -t feat <<<'feat: x'
  bad <<<'foo: x'
  good -t foo <<<'foo: x'
  good -t build:foo <<<'foo: x'
  good -t build -t foo <<<'foo: x'

  # scopes
  bad <<<'feat(): x'
  good <<<'feat(foo): x'
  bad --require-scope <<<'feat: x'
  bad --no-allow-scope <<<'feat(foo): x'
  good --scopes foo:bar <<<'feat(foo): x'
  bad --scopes foo:bar <<<'feat(baz): x'

  # breaking changes
  good <<<'feat!: x'
  good <<<'feat(foo)!: x'

  echo
  printf "%d pass, %d fail\n" "$passes" "$fails"
  exit $((!!fails))
}

good() {
  echo -n "good: "
  test 0 "$@"
}

bad() {
  echo -n "bad: "
  test 1 "$@"
}

test() {
  declare msg status="$1" params=("${@:2}")
  read -rd '' msg ||:

  try() {
    out=$(./hook.bash "${params[@]}" "$@" <(echo "$msg") 2>&1)
  }

  if (( ${#params[@]} )); then
    echo -n "${params[*]}"
  else
    echo -n "(defaults)"
  fi
  echo -n " | $msg ... "

  try

  if [[ $? == "$status" && ( -z $out || $status != 0 ) ]]; then
    echo "pass"
    (( passes++ ))
  else
    echo "fail"
    echo
    try --debug
    echo "$out"
    echo
    (( fails++ ))
  fi
}

main "$@"
