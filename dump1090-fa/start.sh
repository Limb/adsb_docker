#!/bin/sh

service lighttpd start
dump1090-fa --net --lat $DUMP_LAT --lon $DUMP_LON --write-json "/run/dump1090-fa" --quiet
