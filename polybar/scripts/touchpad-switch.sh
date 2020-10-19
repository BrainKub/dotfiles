#!/bin/sh

status() {
	ENABLED=$(( `xinput list-props "Synaptics TM3336-001" | grep "Device Enabled" | cut -d\: -f 2` ))
if [ $ENABLED = 1 ]; then
  echo "󰟸"
else
  echo "󰤳"
fi
}


listen(){
	ENABLED=$(( `xinput list-props "Synaptics TM3336-001" | grep "Device Enabled" | cut -d\: -f 2` ))
if [ $ENABLED = 1 ]; then
  echo "󰟸"
else
  echo "󰤳"
fi
}


toggle() {
	ENABLED=$(( `xinput list-props "Synaptics TM3336-001" | grep "Device Enabled" | cut -d\: -f 2` ))
if [ $ENABLED = 1 ]; then
  ENABLE=0
  echo "󰤳"
else
  ENABLE=1
  echo "󰟸"
fi

xinput -set-prop "Synaptics TM3336-001" "Device Enabled" $ENABLE
}

case "$1" in
    --toggle)
        toggle
        ;;
    *)
        listen
        ;;
esac