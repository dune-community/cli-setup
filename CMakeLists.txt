project("dune-cli-setup" CXX)

cmake_minimum_required(VERSION 2.8)

set(UTILS_PATH ${CMAKE_INSTALL_PREFIX}/share/dune)
configure_file(dune_setup dune_setup @ONLY)
configure_file(dune_setup_only dune_setup_only @ONLY)
configure_file(dune_setup_module dune_setup_module @ONLY)

install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/dune_setup
                 ${CMAKE_CURRENT_BINARY_DIR}/dune_setup_module
                 ${CMAKE_CURRENT_BINARY_DIR}/dune_setup_only
                 ${CMAKE_CURRENT_SOURCE_DIR}/dune_clion.py
        DESTINATION ${CMAKE_INSTALL_PREFIX}/bin )
install(FILES dune_utils.bash
        DESTINATION ${UTILS_PATH} )

