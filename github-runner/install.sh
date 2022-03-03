#! /usr/bin/env bash
cd $RUNNER_DIR

runner_file="actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz"

if [[ -f $runner_file ]]; then
  echo "${runner_file} exists. skipping download."
else
  runner_url="https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/${runner_file}"
  echo "Downloading: ${runner_url}"
  curl -Ss -O -L $runner_url

  tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

  rm ./*.tar.gz
fi
