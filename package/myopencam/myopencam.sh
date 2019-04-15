#!/bin/sh
#
# Usage: ./myopencam.sh [ --start|--stop ] [ sensor ]
#

# ar0130 mn34031 imx104 icx692 ov9712 9m034 imx122 mt9p006
# imx138 soih22 ov2710 himax1375 gc1004 gc1014 ar0330 ar0331

SNS_A=gc1004
KOPATH="./kdriver"

if [ $# -ge 2 ]; then
    SNS_A=$2
fi

# Insert modules
insert_ko()
{
    echo -e "\tinsert kernel modules ..."
    insmod ${KOPATH}/hi_adc.ko
    insmod ${KOPATH}/hi_rtc.ko
    insmod ${KOPATH}/gpio_aplink.ko
    insmod ${KOPATH}/motogpio.ko            # from original encoder app
    #modprobe mymotogpio    later ;)
}

# Remove modules
remove_ko()
{
    echo -e "\tremove kernel modules ..."
    rmmod motogpio
    #rmmod mymotogpio
    rmmod gpio_aplink
    rmmod hi_rtc
    rmmod hi_adc
}

report_error()
{
    echo "******* Error: There's something wrong, please check! *****"
    exit 1
}

load_usage()
{
    echo "Usage:  ./myopencam.sh [-option] [sensor_name]"
    echo "options:"
    echo "    -h                        help information"
    echo -e "for example: ./myopencam.sh\n"
}



#
# Main app. management
#
#
# manage call options
if [ "$1" = "--start" ]
then
    echo -e "myopencam asked to start ..."
    source ./low_power.sh
    insert_ko
fi

if [ "$1" = "-r" ]
then
    echo -e "... asked to stop myopencam"
    remove_ko
fi

if [ "$1" = "-h" ]
then
    load_usage
    exit
fi

