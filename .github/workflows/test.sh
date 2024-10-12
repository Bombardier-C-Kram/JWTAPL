#!/bin/env bash
unset DISPLAY
cd "${GITHUB_WORKSPACE}"
xvfb-run "${GITHUB_WORKSPACE}/.github/workflows/test.apls"