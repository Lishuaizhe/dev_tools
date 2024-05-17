#!/bin/bash

## get script dir
OldDir=$(pwd)
DIR=$(cd "$(dirname "$0")/.." && pwd)
cd "$OldDir" || exit

echo  $DIR

MOD_NAME=$1
if [ -z "$MOD_NAME"  ]; then
   echo  "输入模块名"
   exit
fi

MOD_PATH="$DIR/lib/app/${MOD_NAME}"
echo "$MOD_PATH"

if [ -e "$MOD_PATH"  ]; then
   echo  "输入模块名: $MOD_NAME 已存在!"
   exit
fi

DIR_LIST=("api/dto" "convertor" "db" "entity" "event" "mock" "module" "pages" "service")
N_DIR=${#DIR_LIST[*]}

for ((i=0;i<N_DIR;i++));
do
  echo "${MOD_PATH}/${DIR_LIST[$i]}"
  mkdir -p "${MOD_PATH}/${DIR_LIST[$i]}"
done

toFirstLetterUpper() {
  str=$1
  firstLetter=$(echo "${str:0:1}" | awk '{print toupper($0)}')
  otherLetter=${str:1}
  result=$firstLetter$otherLetter
  echo "$result"
}

UPPER_MOD_NAME=$(toFirstLetterUpper "$MOD_NAME")
NOW=$(date +"%Y-%m-%d %H:%M:%S")

echo "import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';

/// FileName: ${MOD_NAME}_module.dart
///
/// @Date: $NOW
/// @Description:

@AppModule(priority: modulePriorityDefault)
class ${UPPER_MOD_NAME}Module extends Module {
   ${UPPER_MOD_NAME}Module({ int priority = 0})
      : super(name: \"${MOD_NAME}\", priority: priority);
}" > "${MOD_PATH}/module/${MOD_NAME}_module.dart"

echo "${MOD_NAME} 模块模板生成完成"