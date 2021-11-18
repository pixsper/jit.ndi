cmake_minimum_required(VERSION 3.19)

SET(JIT_NDI_COMMON_INCLUDES ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(jit.ndi.receive~)
add_subdirectory(jit.ndi.send~)