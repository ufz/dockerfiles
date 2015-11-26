MXE_TARGETS := i686-w64-mingw32.static
LOCAL_PKG_LIST := gcc boost eigen pthreads vtk6
.DEFAULT local-pkg-list:
local-pkg-list: $(LOCAL_PKG_LIST)
