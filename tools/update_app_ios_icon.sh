#!/bin/bash

## get script dir
OldDir=$(pwd)
DIR=$(cd "$(dirname "$0")/.." && pwd)
cd "$OldDir" || exit

SOURCE_DIR=$1
if [ ! -d "$SOURCE_DIR" ]; then
  echo "目录: $SOURCE_DIR 不存在!"
  exit
fi

DEST_SUB_DIR=('20' '29' '40' '60' '76' '83.5' '1024')

# 复制文件函数
function copy_dirs() {
  TEMP_SOURCE_DIR=$1
  TEMP_DEST_DIR=$2
  TEMP_TYPE=$3

  # 遍历源目录下的所有文件和子目录
  for file in "$TEMP_SOURCE_DIR"/*.png; do
    TT=$(basename "$file")

    #    echo "$file"
    CC=$(echo "$file" | grep "@" | wc -l)
    #    echo $CC
    if [ "$CC" -eq "0" ]; then
      echo "$TEMP_DEST_DIR/Icon-App-${TEMP_TYPE}x${TEMP_TYPE}@1x.png"
      cp "$file" "$TEMP_DEST_DIR/Icon-App-${TEMP_TYPE}x${TEMP_TYPE}@1x.png"
    else
      scale=$(echo "$file" | grep -oE '@(\d+)x' | grep -oE '\d+')

      if [ "$CC" -le "4" ]; then
        echo "$TEMP_DEST_DIR/Icon-App-${TEMP_TYPE}x${TEMP_TYPE}@${scale}x.png"

        cp "$file" "$TEMP_DEST_DIR/Icon-App-${TEMP_TYPE}x${TEMP_TYPE}@${scale}x.png"

      fi
    fi
  done
}

for ((i = 0; i < ${#DEST_SUB_DIR[@]}; i++)); do
  if [[ -d "$SOURCE_DIR/${DEST_SUB_DIR[i]}" ]]; then
    copy_dirs "$SOURCE_DIR/${DEST_SUB_DIR[i]}" "$DIR/ios/Runner/Assets.xcassets/AppIcon.appiconset" "${DEST_SUB_DIR[i]}"
  fi
done
