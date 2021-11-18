cmake_minimum_required(VERSION 3.19)

add_library(newtek-ndi-sdk INTERFACE)
target_include_directories(newtek-ndi-sdk INTERFACE newtek-ndi-sdk)

add_library(yxml STATIC yxml/yxml.c)
target_include_directories(yxml PUBLIC yxml)

add_subdirectory(jit.ndi)
