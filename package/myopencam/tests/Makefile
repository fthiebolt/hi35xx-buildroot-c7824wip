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

LIBS += $(LIB_STAGING_DIR)/libisp.a
LIBS += $(LIB_STAGING_DIR)/libmpi.a


ifneq ($(HIARCH),hi3518)
LIBS += $(LIB_STAGING_DIR)/libhdmi.a
else
CFLAGS += -DHI_3518	
endif

# sensor input type: ar130 mn34031
SNS:=$(MAKECMDGOALS)
                    

ifeq ($(SNS),)
SNS:=ov9712
endif

ifeq ($(SNS), ar130)
LIBS += $(LIB_STAGING_DIR)/libsns_ar0130_720p.a
CFLAGS += -DSNS_AR0130
endif

ifeq ($(SNS), 9m034)
LIBS += $(LIB_STAGING_DIR)/libsns_9m034.a
CFLAGS += -DSNS_9M034
endif

ifeq ($(SNS), imx104)
LIBS += $(LIB_STAGING_DIR)/libsns_imx104.a
CFLAGS += -DSNS_IMX104
endif

ifeq ($(SNS), imx122)
LIBS += $(LIB_STAGING_DIR)/libsns_imx122.a
CFLAGS += -DSNS_IMX122
endif

ifeq ($(SNS), mn34031)
LIBS += $(LIB_STAGING_DIR)/libsns_mn34031_720p.a
CFLAGS += -DSNS_MN34031
endif

ifeq ($(SNS), ov9712)
LIBS += $(LIB_STAGING_DIR)/libsns_ov9712.a
CFLAGS += -DSNS_OV9712
endif

ifeq ($(SNS), icx692)
LIBS += $(LIB_STAGING_DIR)/libsns_icx692.a
CFLAGS += -DSNS_ICX692
endif

ifeq ($(SNS), imx138)
LIBS += $(LIB_STAGING_DIR)/libsns_imx138.a
CFLAGS += -DSNS_IMX138
endif

ifeq ($(SNS), 9p006)
LIBS += $(LIB_STAGING_DIR)/libsns_mt9p006.a
CFLAGS += -DSNS_9P006
endif

ifeq ($(SNS), po3100k)
LIBS += $(LIB_STAGING_DIR)/libsns_po3100k.a
CFLAGS += -DSNS_PO3100K
endif

ifeq ($(SNS), ar0330)
LIBS += $(LIB_STAGING_DIR)/libsns_ar0330_1080p.a
CFLAGS += -DSNS_AR0330
endif

ifeq ($(SNS), imx236)
LIBS += $(LIB_STAGING_DIR)/libsns_imx236.a
CFLAGS += -DSNS_IMX236
endif

ifeq ($(CONFIG_ISP), y)
CFLAGS += -DISP_V1
else
LIBS += $(LIB_STAGING_DIR)/lib_hiae.a
LIBS += $(LIB_STAGING_DIR)/lib_hiawb.a
LIBS += $(LIB_STAGING_DIR)/lib_hiaf.a
CFLAGS += -DISP_V2 -lm
endif


#
# Hisilicon Audio libraries
AUDIO_LIBS += $(LIB_STAGING_DIR)/libVoiceEngine.a \
		$(LIB_STAGING_DIR)/libaec.a \
        $(LIB_STAGING_DIR)/libresampler.a \
        $(LIB_STAGING_DIR)/libanr.a\
        $(LIB_STAGING_DIR)/libvqev2.a


TARGET := $(OBJ:%.o=%)

.PHONY : clean all $(SNS)

all: $(TARGET)

$(TARGET):%:%.o 
	$(CC) $(CFLAGS)  -o $@ $^ $(LIBS) $(AUDIO_LIBS) -Wl,-gc-sections
	@rm *.o
clean:
	@rm -f $(TARGET)
	@rm -f $(OBJ)

ifneq ($(SNS), clean)
$(SNS): all
	@echo
endif

