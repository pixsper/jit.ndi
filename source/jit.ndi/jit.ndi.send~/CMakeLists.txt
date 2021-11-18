include(../../max-sdk-base/script/max-pretarget.cmake)

include_directories(
		"${MAX_SDK_INCLUDES}"
		"${MAX_SDK_MSP_INCLUDES}"
		"${MAX_SDK_JIT_INCLUDES}"
		"${JIT_NDI_COMMON_INCLUDES}"
)

set(PROJECT_SRC
		"jit.ndi.send.c"
		"max.jit.ndi.send~.c"
)

add_library(
		${PROJECT_NAME}
		MODULE
		${PROJECT_SRC}
)

target_link_libraries(
		${PROJECT_NAME}
		PRIVATE
		newtek-ndi-sdk
		yxml
)

include(../../max-sdk-base/script/max-posttarget.cmake)