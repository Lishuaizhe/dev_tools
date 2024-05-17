#!/bin/bash
OldDir=$(pwd)
DIR=$(cd "$(dirname "$0")/.." && pwd)
cd "$OldDir" || exit

flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs

"$DIR"/tools/assets_gen.pl