#!/bin/bash
while :
 do
  #play playlist
  cd ~/minion
  vlc --fullscreen --repeat --video-on-top --no-qt-privacy-ask --no-video-title --no-video-deco --no-sub-autodetect-file --loop --no-qt-error-dialogs playlist.vlc
  printf "${YL}Everything is FINE${NC}"
  sleep 10
done
