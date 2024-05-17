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

DEST_SUB_DIR=('mipmap-hdpi' 'mipmap-mdpi' 'mipmap-xhdpi' 'mipmap-xxhdpi' 'mipmap-xxxhdpi')
FILE_COUNT=$(ls "$SOURCE_DIR" | wc -l)

function copy_files() {
  for file in "$1"/*.png; do
    echo "copy_file: $2/ic_launcher.png"
    cp "$file" "$2/ic_launcher.png"
    break
  done
}

# 复制文件函数
function copy_dirs() {
  TEMP_SOURCE_DIR=$1
  TEMP_DEST_DIR=$2

  # 遍历源目录下的所有文件和子目录
  for file in "$TEMP_SOURCE_DIR"/*; do
    TT=$(basename "$file")

    if [[ -d "$TEMP_DEST_DIR/$TT" ]]; then
      # 如果是子目录，则递归调用 copy_files 函数
      copy_files "$file" "$TEMP_DEST_DIR/$TT"
    fi
  done
}

function read_file() {
  SAVE_IFS=$IFS
  IFS=$(echo -en "\n\b")
  for file in $(ls "$1"); do
    echo "$file"
    break
  done
  IFS=$SAVE_IFS
}

copy_dirs "$SOURCE_DIR" "$DIR/android/app/src/main/res"
