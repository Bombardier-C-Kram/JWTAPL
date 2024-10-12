#!/bin/env bash
set -x
cd "${GITHUB_WORKSPACE}"
chmod +x "${GITHUB_WORKSPACE}/.github/workflows/activate.apls" "${GITHUB_WORKSPACE}/.github/workflows/test.apls"
"${GITHUB_WORKSPACE}/.github/workflows/activate.apls"