#!/usr/bin/env bash

pwd=$(pwd)
go_gen_path="${pwd}/../go/"
rm -rf "${go_gen_path}"

files=$(find . -name "*.proto")
mkdir "${go_gen_path}"

for file in ${files}; do
#  echo "processing ${file}"

  sub_dir=$(dirname "${file}")
  file_name=$(basename "${file}")

  protoc --go_out="${go_gen_path}" --go_opt=paths=source_relative "${file}"

done


cd "${go_gen_path}"
go mod init "github.com/hotstar/x-page-bff-protos/go"
go mod tidy