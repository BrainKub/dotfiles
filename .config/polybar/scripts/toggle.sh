#!/bin/sh



listen(){
    p='ps aux| grep "polybar info"| head -1 | tr -s " " |cut -d" " -f11-12'
if [ "do $p" == "polybar info" ]; then
  echo "󰅂"
  echo "$p"
else
  echo "󰅁"
  do $p
fi
}

toggle(){
    p='ps aux| grep "polybar info"| head -1 | tr -s " " |cut -d" " -f11-12'
if [ "$p" = "polybar info" ]; then
  ps aux| grep "polybar info"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
else
  ps aux| grep "polybar info"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
  polybar info >>/tmp/polybar3.log 2>&1 &
fi
}

case "$1" in
    --toggle)
        toggle
        ;;
    *)
        listen
        ;;
esac