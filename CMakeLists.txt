set(NFD_HEADERS src/nfd_common.h src/common.h src/simple_exec.h)
set(NFD_SOURCES src/nfd_common.c)

if(WIN32)
  list(APPEND NFD_SOURCES src/nfd_win.cpp)

elseif(APPLE)
  list(APPEND NFD_SOURCES src/nfd_cocoa.m)

elseif(UNIX)
  list(APPEND NFD_SOURCES src/nfd_gtk.c)

else()
  message(FATAL_ERROR "Unknown or unsupported OS")
endif()

add_library(nativefiledialog ${NFD_HEADERS} ${NFD_SOURCES})

target_include_directories(nativefiledialog PUBLIC src/include)

if(APPLE)
  target_link_libraries(nativefiledialog PRIVATE "-framework Foundation -framework AppKit")
endif()