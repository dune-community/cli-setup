project("dune-cli-setup" CXX)

cmake_minimum_required(VERSION 3.1)

set(UTILS_PATH ${CMAKE_INSTALL_PREFIX}/share/dune)
configure_file(dune_setup dune_setup)
configure_file(dune_setup_only dune_setup_only)
configure_file(dune_setup_module dune_setup_module)

install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/dune_setup
                 ${CMAKE_CURRENT_BINARY_DIR}/dune_setup_module
                 ${CMAKE_CURRENT_BINARY_DIR}/dune_setup_only
        DESTINATION ${CMAKE_INSTALL_PREFIX}/bin )
install(FILES dune_utils.bash
        DESTINATION ${UTILS_PATH} )
