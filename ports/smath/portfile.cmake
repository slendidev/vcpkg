vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO slendidev/smath
    REF v${VERSION}
    SHA512 c5b8c7c1b1eb907662691b0cdc24ef3c1705acf146bf2e3c5681847c3936fa2424f67a301de3ee4abacfcb3733b11f3959394632f510d6e57c49d4d49494e026
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DSMATH_BUILD_EXAMPLES=OFF
        -DSMATH_BUILD_TESTS=OFF
        -DSMATH_BUILD_MODULES=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/smath)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${CURRENT_PORT_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
