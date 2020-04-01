

. more_funx
stock_quickread quit
vecho quit
exit


#----------------------------------------------------------------------#
# set a glowing debug prompt.                                          #
#----------------------------------------------------------------------#
PS4='+ [32m $BASH_SOURCE [33m $FUNCNAME [34m ${LINENO}: [m'
set -xv


#----------------------------------------------------------------------#
# test function :-P                                                    #
#----------------------------------------------------------------------#
function dog
{
echo freddie
}


#----------------------------------------------------------------------#
# a hopefully useful bash debugging tool.                              #
#----------------------------------------------------------------------#
function debug2
{
while : ; do
    echo -n "? "
    answer=$( quick_read.exe )
    case $answer in
        y)
            echo -n "enter variable name: "
            read var_name
            eval echo $var_name == \$$varname
        ;;
        c) echo "enter command:"
            read command
            $command
        ;;
        b|n|=) break ;;
    esac
done

pause
}

#----------------------------------------------------------------------#
# MAIN                                                                 #
#----------------------------------------------------------------------#
while : ; do
    debug2
    stock_read quit
    if [[ $quit == y ]]; then
        exit
    fi
done

