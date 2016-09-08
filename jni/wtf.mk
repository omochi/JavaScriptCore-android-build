LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

MY_SRC_DIR := ../dep/WebKit/Source/WTF

LOCAL_MODULE := wtf
LOCAL_STATIC_LIBRARIES := icuuc icui18n
LOCAL_CFLAGS := \
	-DUSE_SYSTEM_MALLOC=1  \
	-DNDEBUG -O2

LOCAL_CPPFLAGS += -std=gnu++14

LOCAL_EXPORT_C_INCLUDES := \
	$(LOCAL_PATH)/$(MY_SRC_DIR)

LOCAL_C_INCLUDES := \
	$(LOCAL_EXPORT_C_INCLUDES) \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/wtf \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/wtf/dtoa \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/wtf/text \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/wtf/text/icu \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/wtf/threads \
	$(LOCAL_PATH)/$(MY_SRC_DIR)/wtf/unicode


LOCAL_SRC_FILES := \
	$(MY_SRC_DIR)/wtf/Assertions.cpp \
	$(MY_SRC_DIR)/wtf/Atomics.cpp \
	$(MY_SRC_DIR)/wtf/BitVector.cpp \
	$(MY_SRC_DIR)/wtf/CompilationThread.cpp \
	$(MY_SRC_DIR)/wtf/CrossThreadCopier.cpp \
	$(MY_SRC_DIR)/wtf/CryptographicUtilities.cpp \
	$(MY_SRC_DIR)/wtf/CryptographicallyRandomNumber.cpp \
	$(MY_SRC_DIR)/wtf/CurrentTime.cpp \
	$(MY_SRC_DIR)/wtf/DataLog.cpp \
	$(MY_SRC_DIR)/wtf/DateMath.cpp \
	$(MY_SRC_DIR)/wtf/DecimalNumber.cpp \
	$(MY_SRC_DIR)/wtf/FastBitVector.cpp \
	$(MY_SRC_DIR)/wtf/FastMalloc.cpp \
	$(MY_SRC_DIR)/wtf/FilePrintStream.cpp \
	$(MY_SRC_DIR)/wtf/FunctionDispatcher.cpp \
	$(MY_SRC_DIR)/wtf/GregorianDateTime.cpp \
	$(MY_SRC_DIR)/wtf/HashTable.cpp \
	$(MY_SRC_DIR)/wtf/Lock.cpp \
	$(MY_SRC_DIR)/wtf/MD5.cpp \
	$(MY_SRC_DIR)/wtf/MainThread.cpp \
	$(MY_SRC_DIR)/wtf/MediaTime.cpp \
	$(MY_SRC_DIR)/wtf/MetaAllocator.cpp \
	$(MY_SRC_DIR)/wtf/NumberOfCores.cpp \
	$(MY_SRC_DIR)/wtf/OSRandomSource.cpp \
	$(MY_SRC_DIR)/wtf/PageBlock.cpp \
	$(MY_SRC_DIR)/wtf/ParallelHelperPool.cpp \
	$(MY_SRC_DIR)/wtf/ParallelJobsGeneric.cpp \
	$(MY_SRC_DIR)/wtf/ParkingLot.cpp \
	$(MY_SRC_DIR)/wtf/PrintStream.cpp \
	$(MY_SRC_DIR)/wtf/RAMSize.cpp \
	$(MY_SRC_DIR)/wtf/RandomNumber.cpp \
	$(MY_SRC_DIR)/wtf/RefCountedLeakCounter.cpp \
	$(MY_SRC_DIR)/wtf/RunLoop.cpp \
	$(MY_SRC_DIR)/wtf/SHA1.cpp \
	$(MY_SRC_DIR)/wtf/SixCharacterHash.cpp \
	$(MY_SRC_DIR)/wtf/StackBounds.cpp \
	$(MY_SRC_DIR)/wtf/StackStats.cpp \
	$(MY_SRC_DIR)/wtf/StringPrintStream.cpp \
	$(MY_SRC_DIR)/wtf/Threading.cpp \
	$(MY_SRC_DIR)/wtf/WTFThreadData.cpp \
	$(MY_SRC_DIR)/wtf/WordLock.cpp \
	$(MY_SRC_DIR)/wtf/WorkQueue.cpp \
	$(MY_SRC_DIR)/wtf/dtoa.cpp \
	\
	$(MY_SRC_DIR)/wtf/dtoa/bignum-dtoa.cc \
	$(MY_SRC_DIR)/wtf/dtoa/bignum.cc \
	$(MY_SRC_DIR)/wtf/dtoa/cached-powers.cc \
	$(MY_SRC_DIR)/wtf/dtoa/diy-fp.cc \
	$(MY_SRC_DIR)/wtf/dtoa/double-conversion.cc \
	$(MY_SRC_DIR)/wtf/dtoa/fast-dtoa.cc \
	$(MY_SRC_DIR)/wtf/dtoa/fixed-dtoa.cc \
	$(MY_SRC_DIR)/wtf/dtoa/strtod.cc \
	\
	$(MY_SRC_DIR)/wtf/text/AtomicString.cpp \
	$(MY_SRC_DIR)/wtf/text/AtomicStringImpl.cpp \
	$(MY_SRC_DIR)/wtf/text/AtomicStringTable.cpp \
	$(MY_SRC_DIR)/wtf/text/Base64.cpp \
	$(MY_SRC_DIR)/wtf/text/CString.cpp \
	$(MY_SRC_DIR)/wtf/text/StringBuilder.cpp \
	$(MY_SRC_DIR)/wtf/text/StringImpl.cpp \
	$(MY_SRC_DIR)/wtf/text/StringStatics.cpp \
	$(MY_SRC_DIR)/wtf/text/StringView.cpp \
	$(MY_SRC_DIR)/wtf/text/SymbolRegistry.cpp \
	$(MY_SRC_DIR)/wtf/text/TextBreakIterator.cpp \
	$(MY_SRC_DIR)/wtf/text/WTFString.cpp \
	\
	$(MY_SRC_DIR)/wtf/text/icu/UTextProvider.cpp \
	$(MY_SRC_DIR)/wtf/text/icu/UTextProviderLatin1.cpp \
	$(MY_SRC_DIR)/wtf/text/icu/UTextProviderUTF16.cpp \
	\
	$(MY_SRC_DIR)/wtf/threads/BinarySemaphore.cpp \
	\
	$(MY_SRC_DIR)/wtf/unicode/UTF8.cpp \
	\
	$(MY_SRC_DIR)/wtf/unicode/icu/CollatorICU.cpp \
	\
	$(MY_SRC_DIR)/wtf/OSAllocatorPosix.cpp \
	$(MY_SRC_DIR)/wtf/ThreadIdentifierDataPthreads.cpp \
	$(MY_SRC_DIR)/wtf/ThreadingPthreads.cpp \
	\
	$(MY_SRC_DIR)/wtf/generic/MainThreadGeneric.cpp \
	$(MY_SRC_DIR)/wtf/generic/RunLoopGeneric.cpp \
	$(MY_SRC_DIR)/wtf/generic/WorkQueueGeneric.cpp \
	$(MY_SRC_DIR)/wtf/PlatformUserPreferredLanguagesUnix.cpp \
	$(MY_SRC_DIR)/wtf/text/jsconly/TextBreakIteratorInternalICUJSCOnly.cpp

include $(BUILD_STATIC_LIBRARY)
