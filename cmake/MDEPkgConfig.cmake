include_guard(DIRECTORY)
find_package(PkgConfig)

macro(mde_pkg_config_add dest name)
	pkg_check_modules(${name} REQUIRED ${name})
	target_include_directories(
		${dest}
		PRIVATE
		${${name}_INCLUDE_DIRS}
	)
	target_compile_options(
		${dest}
		PRIVATE
		${${name}_CFLAGS_OTHER}
	)
	target_link_directories(
		${dest}
		PRIVATE
		${${name}_LIBRARY_DIRS}
	)
	target_link_options(
		${dest}
		PRIVATE
		${${name}_LDFLAGS_OTHER}
	)
	target_link_libraries(
		${dest}
		PRIVATE
		${${name}_LIBRARIES}
	)
endmacro()

