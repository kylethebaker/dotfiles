#!/usr/bin/env sh
git \
  --git-dir="${HOME}/.dotfiles/" \
  --work-tree="${HOME}" \
  "${@}"
