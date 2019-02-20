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
# objects our module depends on
myobjects-y += hi_rtc.o

ccflags-y := -I$(PWD)/ -DDEBUG -g -std=gnu99 -Wno-declaration-after-statement


.PHONY: all test clean printvars

all: test printvars
	@echo "Compiling ..."
	# [feb.19] kernel-module from buildroot does not call us
	#@echo -e "\e[0;32;1m--Compiling 'rtc'...\e[0;36;1m"
	#@echo -e "\e[0m"
	#$(MAKE) -C $(LINUX_ROOT) M=$(PWD) modules

printvars:
	@$(foreach V,$(sort $(.VARIABLES)),
		$(if $(filter-out environment% default automatic,
			$(origin $V)),$(warning $V=$($V) ($(value $V)))))

test: rtc_test.o
	$(CC) $(CFLAGS) -o rtc_test rtc_test.c -Wl,-gc-sections

clean:
	$(MAKE) -C $(LINUX_ROOT) M=$(PWD) clean
	rm -rf *.ko

