include_guard(DIRECTORY)
include(MDEPkgConfig)

macro(mde_opengl_add name)
	if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
		target_link_libraries(
			${name}
			PRIVATE
			opengl32
		)
	else()
		mde_pkg_config_add(${name} gl)
	endif()
endmacro()

macro(mde_glu_add name)
	if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
		target_link_libraries(
			${name}
			PRIVATE
			glu32
		)
	else()
		mde_pkg_config_add(${name} glu)
	endif()
endmacro()
