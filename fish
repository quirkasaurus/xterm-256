
#----------------------------------------------------------------------#
# for provided variable name,                                          #
# increment or decrement based on fade-direction value.                #
# check for bounds: 0 - 5                                              #
#----------------------------------------------------------------------#
function bump_fade_direction
{
local rgb
eval rgb=\$$1
(( rgb += fade_direction ))
if [[ $rgb -gt 5 ]]; then
    rgb=5
elif [[ $rgb -lt 0 ]]; then
    rgb=0
fi
eval ${1}=$rgb
return
}


function test_bump_fade_direction
{
for r in -1 0 1 2 3 4 5 6 ; do
    for fade_direction in -1 0 1 ; do
        RR=$r
        bump_fade_direction r
        echo was: $RR FAD-DIR $fade_direction =\> is: $r
    done
done
}

