#ifeq ($(PARAM_FILE), )
#		PARAM_FILE:=../../Makefile.param
#		include $(PARAM_FILE)
#endif

# kernel module as 'module' (i.e -m for module)
obj-m := mymotogpio.o

# list all objects our module depends on
myobjects-y += mymotogpio.o 

ccflags-y := -I$(PWD)/ -DDEBUG -g -std=gnu99 -Wno-declaration-after-statement


.PHONY: all clean

all:	
	echo -e "\e[0;32;1m--Compiling 'wtdg'... \e[0;36;1m"
	echo -e "\e[0m" 
	$(MAKE) -C '$(LINUX_DIR)' M='$(PWD)' modules

clean:
	$(MAKE) -C '$(LINUX_ROOT)' M='$(PWD)' clean 
	rm -rf *.ko

