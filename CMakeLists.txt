cmake_minimum_required(VERSION 2.8.12...3.29)

set(FTS_BASE_FOLDER "extension/fts")

project(FTSExtension)

add_extension_definitions()

include_directories(${FTS_BASE_FOLDER}/include ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/libstemmer)
set(FTS_SOURCES
    ${FTS_BASE_FOLDER}/fts_extension.cpp
    ${FTS_BASE_FOLDER}/fts_indexing.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/libstemmer/libstemmer.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/runtime/utilities.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/runtime/api.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_arabic.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_basque.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_catalan.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_danish.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_dutch.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_english.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_finnish.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_french.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_german.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_german2.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_greek.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_hindi.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_hungarian.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_indonesian.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_irish.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_italian.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_kraaij_pohlmann.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_lithuanian.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_lovins.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_nepali.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_norwegian.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_porter.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_portuguese.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_romanian.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_russian.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_serbian.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_spanish.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_swedish.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_tamil.cpp
    ${DUCKDB_MODULE_BASE_DIR}/third_party/snowball/src_c/stem_UTF_8_turkish.cpp)

build_static_extension(fts ${FTS_SOURCES})
set(PARAMETERS "-warnings")
build_loadable_extension(fts ${PARAMETERS} ${FTS_SOURCES})

install(
  TARGETS fts_extension
  EXPORT "${DUCKDB_EXPORT_SET}"
  LIBRARY DESTINATION "${INSTALL_LIB_DIR}"
  ARCHIVE DESTINATION "${INSTALL_LIB_DIR}")
