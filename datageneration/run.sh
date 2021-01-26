#!/bin/bash

JOB_PARAMS=${1:-'--idx 0 --ishape 0 --stride 50'} # defaults to [0, 0, 50]

# SET PATHS HERE
#export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
#export ARCHFLAGS="-arch x86_64"
#./configure --prefix=/Users/phi/Documents/phi-vision/ffmpeg/ffmpeg_build_sequoia_h264 --enable-avresample --enable-pic --disable-doc --disable-static --enable-shared --enable-gpl --enable-nonfree --enable-postproc --enable-libxcb --disable-yasm --enable-libx264 --extra-ldflags="-I/Users/phi/Documents/phi-vision/ffmpeg/x264_build/include -L/Users/phi/Documents/phi-vision/ffmpeg/x264_build/lib" --extra-cflags="-I/Users/phi/Documents/phi-vision/ffmpeg/x264_build/include"
FFMPEG_PATH=/Users/phi/Documents/phi-vision/ffmpeg/ffmpeg_build_sequoia_h264
X264_PATH=/Users/phi/Documents/phi-vision/ffmpeg/x264_build/

#PYTHON2_PATH=/home/gvarol/tools/anaconda/envs/surreal_env/ # PYTHON 2
BLENDER_PATH=/Users/phi/Documents/phi-vision/blender/blender.app/Contents/MacOS/
#cd surreal/datageneration

# BUNDLED PYTHON
BUNDLED_PYTHON=${BLENDER_PATH}/2.78/python
export PYTHONPATH=${BUNDLED_PYTHON}/lib/python3.4:${BUNDLED_PYTHON}/lib/python3.4/site-packages
export PYTHONPATH=${BUNDLED_PYTHON}:${PYTHONPATH}

# FFMPEG
export LD_LIBRARY_PATH=${FFMPEG_PATH}/lib:${X264_PATH}/lib:${LD_LIBRARY_PATH}
export PATH=${FFMPEG_PATH}/bin:${PATH}


### Runs parts 1 + 2  --- Uses python3 because of Blender
$BLENDER_PATH/blender -b -t 1 -P main_part.py -- ${JOB_PARAMS}

