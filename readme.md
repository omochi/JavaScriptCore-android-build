# Build Steps

Follow to build steps below.

## Select ABIs

Select ABIs and write to `jni/Application.mk`.
`armeabi-v7a` only is default.
You can put multiple archs here normally.

## Get ICU

- Package URL is `https://android.googlesource.com/platform/external/icu4c/+/android-4.4.4_r2.0.1`

```
$ cd dep
$ git clone https://android.googlesource.com/platform/external/icu4c icu
$ cd icu
$ git checkout android-4.4.4_r2.0.1
```

## Patch ICU

```
$ cd dep/icu
$ patch -p0 < ../../patch/icu.patch
```

## Prepare ICU

```
$ script/prepare-icu.rb
```

## Build ICU

```
$ ndk-build icuuc
$ ndk-build icui18n
```

## Get WebKit

- Package URL is `https://trac.webkit.org/browser/releases/WebKitGTK/webkit-2.13.4`
- svn commit is `releases/WebKitGTK/webkit-2.13.4@205581`

```
$ cd dep
$ git clone git://git.webkit.org/WebKit.git WebKit
$ cd WebKit
$ Tools/Scripts/webkit-patch setup-git-clone
$ git checkout 4f72f2a8897d6dbd07d85a2b30c4197bec8fcd72
```

## Patch WTF

```
$ cd dep/WebKit/Source/WTF
$ patch -p0 < ../../../../patch/WTF.patch
```

## Build WTF

```
$ ndk-build wtf
```

## Patch JavaScriptCore

```
$ cd dep/Webkit/Source/JavaScriptCore
$ patch -p0 < ../../../../patch/JavaScriptCore.patch
```

## Prepare JavaScriptCore (1/2)

```
$ script/prepare-jsc.rb 1
```

## Build JIT Information Binary

```
$ ndk-build jsc-offsets
```

## Prepare JavaScriptCore (2/2)

```
$ script/prepare-jsc.rb 2
```

## Build JavaScriptCore

```
$ ndk-build jsc
```

## Link All

```
$ ndk-build jscore
```

## Install

```
$ ndk-build
```

You can get library at `libs/<arch>/libjscore.so`.
You do **not** need `libs/<arch>/libjsc_offsets.so`.
Use headers at `gen/jsc/include`.

# License

My build assets is MIT.

Be careful that JavaScriptCore is LGPL.
Generated binaries are protected it too. 

