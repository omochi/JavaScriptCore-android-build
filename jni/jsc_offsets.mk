LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

MY_SRC_DIR := ../dep/WebKit/Source/JavaScriptCore
MY_GEN_DIR := ../gen/jsc

LOCAL_MODULE := jsc_offsets
LOCAL_STATIC_LIBRARIES := icuuc wtf
LOCAL_CFLAGS += \
	-D__STDC_LIMIT_MACROS \
	-DNDEBUG -O2

LOCAL_CPPFLAGS += -std=gnu++14
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/$(MY_SRC_DIR) \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/API \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/assembler \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/bytecode \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/dfg \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/disassembler \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/heap \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/interpreter \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/jit \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/llint \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/parser \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/profiler \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/runtime \
	$(LOCAL_PATH)/$(MY_GEN_DIR) \
    $(LOCAL_PATH)/$(MY_GEN_DIR)/include
 

LOCAL_SRC_FILES := \
	$(MY_SRC_DIR)/llint/LLIntOffsetsExtractor.cpp

include $(BUILD_SHARED_LIBRARY)