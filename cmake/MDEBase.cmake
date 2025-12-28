include_guard(DIRECTORY)
include(GNUInstallDirs)

macro(mde_setup_base type name dir)
	project(
		${name}
	)

	file(
		GLOB
		${name}_SRC
		*.c
	)

	if(${type} STREQUAL "project")
		add_executable(
			${name}
			${${name}_SRC}
		)
	elseif(${type} STREQUAL "library")
		add_library(
			${name}
			SHARED
			${${name}_SRC}
		)
	endif()

	if(NOT ${name} STREQUAL "MDECore")
		target_link_libraries(
			${name}
			PRIVATE
			MDECore
		)
	endif()
	target_link_libraries(
		${name}
		PRIVATE
		Mw
	)

	install(
		TARGETS ${name}
		DESTINATION ${dir}
	)
endmacro()

macro(mde_setup_project name dir)
	mde_setup_base(project ${name} ${dir})
endmacro()

macro(mde_setup_library name)
	if(NOT ${ARGV1} STREQUAL "")
		mde_setup_base(library ${name} ${ARGV1})
	else()
		mde_setup_base(library ${name} ${CMAKE_INSTALL_LIBDIR})
	endif()

	if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/../include")
		target_include_directories(
			${name}
			PUBLIC
			../include
		)
	endif()
endmacro()

macro(mde_math_add name)
	if(NOT CMAKE_SYSTEM_NAME STREQUAL "Windows")
		target_link_libraries(
			${name}
			PRIVATE
			m
		)
	endif()
endmacro()
