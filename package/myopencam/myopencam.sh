#!/bin/sh
#
# Usage: ./myopencam.sh [ --start|--stop ] [ sensor ]
#

# ar0130 mn34031 imx104 icx692 ov9712 9m034 imx122 mt9p006
# imx138 soih22 ov2710 himax1375 gc1004 gc1014 ar0330 ar0331

SNS_A=ov9712

if [ $# -ge 2 ]; then
    SNS_A=$2
fi

report_error()
{
    echo "******* Error: There's something wrong, please check! *****"
    exit 1
}

load_usage()
{
    echo "Usage:  ./myopencam.sh [-option] [sensor_name]"
    echo "options:"
    echo "    --start                   start app."
    echo "    --stop                    stop app."
    echo "    -h                        help information"
    echo -e "Available sensors: ov9712 ov9712_plus ..."
    echo -e "for example: ./myopencam.sh --start ov9712\n"
}



#
# Main app. management
#
#
# manage call options
if [ "$1" = "--start" ]
then
    echo -e "myopencam asked to start ..."
fi

if [ "$1" = "-r" ]
then
    echo -e "... asked to stop myopencam"
fi

if [ "$1" = "-h" ]
then
    load_usage
    exit
fi

