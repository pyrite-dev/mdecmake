cmake_minimum_required(VERSION 3.25)
project(
	mdebase
)

include(GNUInstallDirs)
install(
	DIRECTORY cmake/
	DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/cmake/mde
)
