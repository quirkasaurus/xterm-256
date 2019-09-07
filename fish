




function compute_next_random
{
set -xv
while :; do
    (( red   = RANDOM % 6 ))
    (( green = RANDOM % 6 ))
    (( blue  = RANDOM % 6 ))
    (( next_color_idx = ( red * 36 ) + ( green * 6 ) + blue + 16 ))
    if is_not_too_dark ; then
        break
    fi
done
return
}


function compute_random
{
local num=0
set -xv
while [[ $num -lt 100 ]]; do
    compute_next_random
    fgs[num]=$next_color_idx
    (( num += 1 ))
done
fgs_pound=100
return
}


_g=48

. ./colors.env
compute_random

for c in ${fgs[*]}; do
    printf "[${_g};5;${c}m %3d " $c
done
echo
printc black,green fini




