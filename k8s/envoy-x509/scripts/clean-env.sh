#/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXAMPLEDIR="$(dirname "$DIR")"
K8SDIR="$(dirname "$EXAMPLEDIR")"


bb=$(tput bold) || true
nn=$(tput sgr0) || true
green=$(tput setaf 2) || true

echo "${bb}Deleting backend and frontends resources...${nn}"
kubectl delete -k ${EXAMPLEDIR}/k8s/. --ignore-not-found

echo "${bb}Deleting all the SPIRE resources available in the cluster...${nn}"
kubectl delete -k ${K8SDIR}/quickstart/. --ignore-not-found

echo "${green}Cleaning completed.${nn}"
