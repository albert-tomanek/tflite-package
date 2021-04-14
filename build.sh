#!/bin/sh

# Clone repo
if [ ! -d "tensorflow/" ]; then
	git clone --depth 1 --branch v2.4.1 https://github.com/tensorflow/tensorflow/
fi

# Build the binary
( cd tensorflow/ && bazel build //tensorflow/lite/c:libtensorflowlite_c.so -c opt)

# Take the necessary files and put them where they need to be within the package.
rm -rf package/
cp -a template package

mkdir -p package/usr/lib/x86_64-linux-gnu/
cp tensorflow/bazel-bin/tensorflow/lite/c/libtensorflowlite_c.so package/usr/lib/x86_64-linux-gnu/
mkdir -p package/usr/include/tensorflow/lite/c/
cp tensorflow/tensorflow/lite/c/c_api.h tensorflow/tensorflow/lite/c/c_api_types.h package/usr/include/tensorflow/lite/c/
