SET(CMAKE_SYSTEM_NAME Windows)

IF (DEFINED ENV{LLVM_MINGW_DIR})
  SET(LLVM_MINGW_ROOT "$ENV{LLVM_MINGW_DIR}")
ELSE ()
  SET(LLVM_MINGW_ROOT "/mnt/data/local/llvm-mingw-20231031-ucrt-ubuntu-20.04-x86_64")
ENDIF()


SET(CMAKE_C_COMPILER ${LLVM_MINGW_ROOT}/bin/x86_64-w64-mingw32-clang)
SET(CMAKE_CXX_COMPILER ${LLVM_MINGW_ROOT}/bin/x86_64-w64-mingw32-clang++)
SET(CMAKE_RC_COMPILER ${LLVM_MINGW_ROOT}/bin/x86_64-w64-mingw32-windres)

#SET(CMAKE_C_LINK_EXECUTABLE x86_64-w64-mingw32-gcc)
#SET(CMAKE_CXX_LINK_EXECUTABLE x86_64-w64-mingw32-g++)

SET(CMAKE_FIND_ROOT_PATH ${LLVM_MINGW_ROOT}/x86_64-w64-mingw32)

# Need Win8(0x602) or later for prefetch API.
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_WIN32_WINNT=0x602")

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)