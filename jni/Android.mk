LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
MY_LOCAL_PATH := $(LOCAL_PATH)

LOCAL_MODULE := jscore
LOCAL_WHOLE_STATIC_LIBRARIES := jsc
include $(BUILD_SHARED_LIBRARY)

include $(MY_LOCAL_PATH)/../dep/icu/Android.mk
include $(MY_LOCAL_PATH)/wtf.mk
include $(MY_LOCAL_PATH)/jsc.mk
include $(MY_LOCAL_PATH)/jsc_offsets.mk