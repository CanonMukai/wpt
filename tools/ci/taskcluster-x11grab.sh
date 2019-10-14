#!/bin/bash

PREFIX="/home/test/artifacts/x11grab"

get_filename () {
  EXT="$1"
  NOW=`date -u "+%Y-%m-%d_%H-%M-%S"`
  echo "${PREFIX}_${NOW}.${EXT}"
}

# capture 10 seconds of video every 5 minutes for at most 2 hours
seq 24 | while read counter; do
  FILENAME=`get_filename mp4`
  ffmpeg -y -video_size "${SCREEN_WIDTH}x${SCREEN_HEIGHT}" -framerate 30 \
    -f x11grab -i "$DISPLAY" -t 10 "$FILENAME"
  sleep 290
done
