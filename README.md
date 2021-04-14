Clones and builds TensorFlow Lite from [here](https://github.com/tensorflow/tensorflow/) and copies the library and header into the directory structure found in `template/`.  
Contains files for use with pkg-config (the package name is `tflite`), and Vala.  
Configured to contain C symbols only.

[Example Gtk app using TensorFlow.]()

# To build and install locally:

You need to have bazel installed to build TensorFlow.

```
	./build.sh
	./make-deb.sh
	sudo dpkg -i libtensorflowlite.deb
```
