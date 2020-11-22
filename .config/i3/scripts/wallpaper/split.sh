#!/bin/bash
dir=$HOME/.pics
x=1
while [ $x -lt 2 ]; do
    hash=`md5sum $HOME/.config/i3/scripts/wallpaper/$x.gif | cut -f1 -d" "`
    [[ ! -d $dir ]] && mkdir $dir 
    [[ ! -d $dir/$x ]] && { 
    mkdir $dir/$x 
    echo "splitting .." 
    convert -coalesce $HOME/.config/i3/scripts/wallpaper/$x.gif $dir/$x/$x.png 
    echo ok  
}
x=$(($x+1))
done