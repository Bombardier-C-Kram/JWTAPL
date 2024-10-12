#!/bin/env bash
unset DISPLAY
cd "${GITHUB_WORKSPACE}"
chmod +x "${GITHUB_WORKSPACE}/.github/workflows/activate.apls" "${GITHUB_WORKSPACE}/.github/workflows/test.apls"
xvfb-run "${GITHUB_WORKSPACE}/.github/workflows/activate.apls"