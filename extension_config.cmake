# This file is included by DuckDB's build system. It specifies which extension to load

################# FTS
duckdb_extension_load(fts
	DONT_LINK
	SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}
	INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/extension/fts/include
	${LOAD_FTS_TESTS}
)
