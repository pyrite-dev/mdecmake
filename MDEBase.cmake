include(GNUInstallDirs)

macro(setup_project name dir)
	project(
		${name}
	)

	file(
		GLOB
		${name}_SRC
		*.c
	)

	add_executable(
		${name}
		${${name}_SRC}
	)

	target_link_libraries(
		${name}
		PRIVATE
		MDELib Mw
	)

	install(
		TARGETS ${name}
		DESTINATION ${dir}
	)
endmacro()
