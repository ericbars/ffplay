LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := ffmpeg

LOCAL_SRC_FILES := prebuilt/libffmpeg.so

include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := SDL2

LOCAL_SRC_FILES := prebuilt/libSDL2.so

include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include/sdl2
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include


LOCAL_MODULE    := ffplay
LOCAL_SRC_FILES := cmdutils.c ffplay.c 

# for logging
LOCAL_LDLIBS    += -llog
# for native windows
LOCAL_LDLIBS    += -landroid
# for egl
LOCAL_LDLIBS += -lEGL
# for OpenGL
LOCAL_LDLIBS += -lGLESv2
# for native audio
LOCAL_LDLIBS    += -lOpenSLES

LOCAL_SHARED_LIBRARIES := libffmpeg
LOCAL_SHARED_LIBRARIES += libSDL2
LOCAL_SHARED_LIBRARIES += libcutil
LOCAL_SHARED_LIBRARIES += libstlport

LOCAL_CFLAGS += -D__STDC_CONSTANT_MACROS=1
LOCAL_CFLAGS += -D__STDC_FORMAT_MACROS=1
LOCAL_CFLAGS += -D__ANDROID_API__=19
 
include $(BUILD_SHARED_LIBRARY)
