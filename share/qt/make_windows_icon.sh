#!/bin/bash
# create multiresolution windows icon
ICON_DST=../../src/qt/res/icons/ebolashare.ico

convert ../../src/qt/res/icons/ebolashare-16.png ../../src/qt/res/icons/ebolashare-32.png ../../src/qt/res/icons/ebolashare-48.png ${ICON_DST}
