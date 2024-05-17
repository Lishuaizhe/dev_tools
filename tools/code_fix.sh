#!/bin/bash
## get script dir
OldDir=$(pwd)
DIR=$(cd "$(dirname "$0")/.." && pwd)
cd "$OldDir" || exit

dart fix --apply "$DIR/lib/"