#!/bin/env bash
set -x
unset DISPLAY
cd "${GITHUB_WORKSPACE}"
xvfb-run "${GITHUB_WORKSPACE}/.github/workflows/test.apls"