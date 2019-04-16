#######################################################################
#
# Tests apps. imported from Himpp package
#
# [apr.19] added support for shared libs
#          and SWITCH TO DYNAMIC LIBS :)
# [feb.19] added rtc_test from kdriver/rtc/rtc_test
#
ifeq ($(PARAM_FILE), )
     PARAM_FILE:=../Makefile.param
     include $(PARAM_FILE)
endif

SRC  := $(wildcard *.c)
OBJ  := $(SRC:%.c=%.o)

#
# Relatives includes and libraries paths
REL_INC?=../include
REL_LIB?=../lib

INC_FLAGS:=-I$(REL_INC)
LIB_FLAGS:=-L$(REL_LIB)

CFLAGS += $(MYOPENCAM_CFLAGS) $(INC_FLAGS) $(LIB_FLAGS) -lpthread

LIBS_SO += -lisp
LIBS += $(LIB_STAGING_DIR)/libisp.a
LIBS_SO += -lmpi
LIBS += $(LIB_STAGING_DIR)/libmpi.a


ifneq ($(HIARCH),hi3518)
LIBS_SO += -lhdmi
LIBS += $(LIB_STAGING_DIR)/libhdmi.a
else
CFLAGS += -DHI_3518	
endif

# sensor input type: ar130 mn34031
SNS:=$(MAKECMDGOALS)
                    
# Sensor default definition
# Note: VstarCam C7824WIP is a GalaxyCore GC1024
# 		while gc1004 DOES NOT WORK!
ifeq ($(SNS),)
SNS:=gc1014
#SNS:=gc1024
endif
$(info CMOS sensor set to '${SNS}')

ifeq ($(SNS), ar130)
LIBS_SO += -lsns_ar0130_720p
LIBS += $(LIB_STAGING_DIR)/libsns_ar0130_720p.a
CFLAGS += -DSNS_AR0130
endif

ifeq ($(SNS), 9m034)
LIBS_SO += -lsns_9m034
LIBS += $(LIB_STAGING_DIR)/libsns_9m034.a
CFLAGS += -DSNS_9M034
endif

ifeq ($(SNS), imx104)
LIBS_SO += -lsns_imx104
LIBS += $(LIB_STAGING_DIR)/libsns_imx104.a
CFLAGS += -DSNS_IMX104
endif

ifeq ($(SNS), imx122)
LIBS_SO += -lsns_imx122
LIBS += $(LIB_STAGING_DIR)/libsns_imx122.a
CFLAGS += -DSNS_IMX122
endif

ifeq ($(SNS), mn34031)
LIBS_SO += -lsns_mn34031_720p
LIBS += $(LIB_STAGING_DIR)/libsns_mn34031_720p.a
CFLAGS += -DSNS_MN34031
endif

ifeq ($(SNS), ov9712)
LIBS_SO += -lsns_ov9712
LIBS += $(LIB_STAGING_DIR)/libsns_ov9712.a
CFLAGS += -DSNS_OV9712
endif

ifeq ($(SNS), icx692)
LIBS_SO += -lsns_icx692
LIBS += $(LIB_STAGING_DIR)/libsns_icx692.a
CFLAGS += -DSNS_ICX692
endif

ifeq ($(SNS), imx138)
LIBS_SO += -lsns_imx138
LIBS += $(LIB_STAGING_DIR)/libsns_imx138.a
CFLAGS += -DSNS_IMX138
endif

ifeq ($(SNS), 9p006)
LIBS_SO += -lsns_mt9p006
LIBS += $(LIB_STAGING_DIR)/libsns_mt9p006.a
CFLAGS += -DSNS_9P006
endif

ifeq ($(SNS), po3100k)
LIBS_SO += -lsns_po3100k
LIBS += $(LIB_STAGING_DIR)/libsns_po3100k.a
CFLAGS += -DSNS_PO3100K
endif

ifeq ($(SNS), ar0330)
LIBS_SO += -lsns_ar0330_1080p
LIBS += $(LIB_STAGING_DIR)/libsns_ar0330_1080p.a
CFLAGS += -DSNS_AR0330
endif

ifeq ($(SNS), imx236)
LIBS_SO += -lsns_imx236
LIBS += $(LIB_STAGING_DIR)/libsns_imx236.a
CFLAGS += -DSNS_IMX236
endif

ifeq ($(SNS), gc1004)
LIBS_SO += -lsns_gc1004
LIBS += $(LIB_STAGING_DIR)/libsns_gc1004.a
CFLAGS += -DSNS_GC1004
endif

ifeq ($(SNS), gc1014)
LIBS_SO += -lsns_gc1014
LIBS += $(LIB_STAGING_DIR)/libsns_gc1014.a
CFLAGS += -DSNS_GC1014
endif

ifeq ($(SNS), gc1024)
# [apr.19] we don't have source code for gc1024 lib
# libsns_gc1024.so comes from the original firmware and required libisp
LIBS_SO += -lsns_gc1024
#LIBS += $(LIB_STAGING_DIR)/libsns_gc1024.a
CFLAGS += -DSNS_GC1024
endif

ifeq ($(CONFIG_ISP), y)
CFLAGS += -DISP_V1
else
LIBS += $(LIB_STAGING_DIR)/lib_hiae.a
LIBS += $(LIB_STAGING_DIR)/lib_hiawb.a
LIBS += $(LIB_STAGING_DIR)/lib_hiaf.a
LIBS += -lm 
LIBS_SO += -l_hiae -l_hiawb -l_hiaf -lm
CFLAGS += -DISP_V2
endif


#
# Hisilicon Audio libraries
AUDIO_LIBS += $(LIB_STAGING_DIR)/libVoiceEngine.a \
        $(LIB_STAGING_DIR)/libaec.a \
        $(LIB_STAGING_DIR)/libresampler.a \
        $(LIB_STAGING_DIR)/libanr.a\
        $(LIB_STAGING_DIR)/libvqev2.a
AUDIO_LIBS_SO += -lVoiceEngine -laec -lresampler -lanr -lvqev2

#
# TODO: usefull ??
#LIBS += -ljpeg
##LIBS += $(LIB_STAGING_DIR)/libjpeg.a


#
# [apr.19] switch all to dynamic libs
LIBS := $(LIBS_SO)
AUDIO_LIBS := $(AUDIO_LIBS_SO)

TARGET := $(OBJ:%.o=%)

.PHONY : clean all $(SNS)

all: $(TARGET) rtc_test

$(TARGET):%:%.o 
	$(CC) $(CFLAGS)  -o $@ $^ $(LIBS) $(AUDIO_LIBS) -Wl,-gc-sections
	@rm *.o

rtc_test:
	$(CC) $(CFLAGS) -I./ -o $@ ../kdriver/rtc/rtc_test.c $(LIBS) $(AUDIO_LIBS) -Wl,-gc-sections

clean:
	@rm -f $(TARGET)
	@rm -f $(OBJ)

ifneq ($(SNS), clean)
$(SNS): all
	@echo
endif

