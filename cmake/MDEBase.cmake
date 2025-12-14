include_guard(DIRECTORY)
include(GNUInstallDirs)

macro(setup_base type name dir)
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

macro(setup_project name dir)
	setup_base(project ${name} ${dir})
endmacro()

macro(setup_library name)
	if(ARGV2)
		setup_base(library ${name} ${CMAKE_INSTALL_LIBDIR}/ARGV2)
	else()
		setup_base(library ${name} ${CMAKE_INSTALL_LIBDIR})
	endif()

	if(EXISTS "../include")
		target_include_directories(
			${name}
			PUBLIC
			../include
		)
	endif()
endmacro()

macro(math_add name)
	if(NOT CMAKE_SYSTEM_NAME STREQUAL "Windows")
		target_link_libraries(
			${name}
			PRIVATE
			m
		)
	endif()
endmacro()
