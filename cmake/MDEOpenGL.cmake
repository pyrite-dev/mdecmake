include_guard(DIRECTORY)
include(MDEPkgConfig)

macro(opengl_add name)
	if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
		target_link_libraries(
			${name}
			PRIVATE
			opengl32
		)
	else()
		pkg_config_add(${name} gl)
	endif()
endmacro()

macro(glu_add name)
	if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
		target_link_libraries(
			${name}
			PRIVATE
			glu32
		)
	else()
		pkg_config_add(${name} glu)
	endif()
endmacro()
