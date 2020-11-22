 #!/bin/bash
select1='feh --bg-fill'
select2='xwallpaper --zoom'
select3='xloadimage -onroot -fullscreen'
select4='xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s'
prog=$select1
[ "$#" -lt "1" ] || [ "$#" -gt "2" ] && {  echo -e "ERROR : args number invalid \n $0 speed /path/name.gif" ; echo "try 0.010 as speed" ; exit 1 ; }
dir=$HOME/.pics  
#example of speed  : 0.010
speed=$1

while :
do
x=$((RANDOM%8+1))
end_time=$(($(date +%s) + 200))

    while [ "$(date +%s)" -lt "$end_time" ]; do
    for i 
    in ` ls $dir/$x -v ` ;
    do $prog $dir/$x/$i ;
    sleep $speed ; 
    done ; 
    done
done