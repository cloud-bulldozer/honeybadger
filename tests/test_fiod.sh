#!/usr/bin/env bash
set -xeo pipefail

source tests/common.sh

function finish {
  echo "Cleaning up Fio"
  kubectl delete -f tests/test_crs/valid_fiod.yaml
  delete_operator
}

trap finish EXIT

function functional_test_fio {
  #figlet $(basename $0)
  apply_operator
  kubectl apply -f tests/test_crs/valid_fiod.yaml
  pod_count 'app=fio-benchmark-0' 2 300
  fio_pod=$(get_pod 'app=fiod-client-0' 300)
  kubectl wait --for=condition=Initialized "pods/$fio_pod" --namespace ripsaw --timeout=200s
  kubectl wait --for=condition=complete -l app=fiod-client-0 jobs --namespace ripsaw --timeout=300s
  sleep 30
  # ensuring the run has actually happened
  kubectl logs "$fio_pod" --namespace ripsaw | grep "Run status"
  echo "Fio distributed test: Success"
}

functional_test_fio
