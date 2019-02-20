#ifeq ($(PARAM_FILE), )
#		PARAM_FILE:=../../Makefile.param
#		include $(PARAM_FILE)
#endif

EXTRA_CFLAGS += -DHIDEBUG -g

# built as a Module (i.e xxx-m)
obj-m := hi_wdt.o
# our module depends on list ob objects
myobjects-y += hi_wdt.o 

ccflags-y := -I$(PWD)/ -DDEBUG -g -std=gnu99 -Wno-declaration-after-statement


.PHONY: all clean

all:
	echo -e "\e[0;32;1m--Compiling 'wtdg'... \e[0;36;1m"
	echo -e "\e[0m" 
	$(MAKE) -C $(LINUX_ROOT) M=$(PWD) modules 

clean:
	$(MAKE) -C $(LINUX_ROOT) M=$(PWD) clean 
	rm -rf *.ko

