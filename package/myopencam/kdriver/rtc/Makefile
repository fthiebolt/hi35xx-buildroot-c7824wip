#Create by liucan, 2012/12/26

#ifeq ($(PARAM_FILE), )
#    PARAM_FILE:=../..//Makefile.param
#    include $(PARAM_FILE)
#endif


EXTRA_CFLAGS += -DHIDEBUG -g
#EXTRA_CFLAGS += -D$(HI_FPGA)


#
# as a module (i.e xxx-m for module)
obj-m := hi_rtc.o
# ... built-in kernel (i.e xxx-y for 'yes')
hirtc-y := hi_rtc.o

ccflags-y := -I$(@D)/include -I$(PWD)/ -DDEBUG -g -std=gnu99 -Wno-declaration-after-statement


.PHONY: all test clean

all: test
	@echo -e "\e[0;32;1m--Compiling 'rtc'...\e[0;36;1m"
	@echo -e "\e[0m"
	@echo $* = $($*)
	$(MAKE) -C $(LINUX_ROOT) M=$(PWD) modules

test: rtc_test.o
	$(CROSS_COMPILE)gcc $(CFLAGS) -o rtc_test rtc_test.c -Wl,-gc-sections

clean:
	$(MAKE) -C $(LINUX_ROOT) M=$(PWD) clean
	rm -rf *.ko

