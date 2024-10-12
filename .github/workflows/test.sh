#!/bin/env bash
set -x
cd "${GITHUB_WORKSPACE}"
xvfb-run "${GITHUB_WORKSPACE}/.github/workflows/test.apls"