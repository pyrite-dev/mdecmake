find_package(PkgConfig)

macro(pkg_config_add dest name)
	pkg_check_modules(${name} REQUIRED ${name})
	target_include_directories(
		${dest}
		PRIVATE
		${${name}_INCLUDE_DIRS}
	)
	target_link_directories(
		${dest}
		PRIVATE
		${${name}_LIBRARY_DIRS}
	)
	target_link_libraries(
		${dest}
		PRIVATE
		${${name}_LIBRARIES}
	)
endmacro()

