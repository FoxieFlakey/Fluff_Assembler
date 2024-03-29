# Build config

set(BUILD_PROJECT_NAME "FluffAssembler")

# We're making library
set(BUILD_IS_LIBRARY NO)
set(BUILD_IS_KERNEL NO)

# If we want make libary and
# executable project
set(BUILD_INSTALL_EXECUTABLE YES)
set(BUILD_MAXIMUM_PERFORMANCE NO)

# Sources which common between exe and library
set(BUILD_SOURCES
  src/dummy.c
  src/lexer.c
  src/util.c
  src/bytecode/bytecode.c
  src/bytecode/prototype.c
  src/code_emitter.c
  src/common.c
  src/parser_stage1.c
  src/parser_stage2.c
  src/statement_compiler.c
  src/default_statement_processors.c
  src/token_iterator.c
  src/bytecode/protobuf_serializer.c
  src/assembler_driver.c
  
  deps/buffer/buffer.c
  deps/templated-hashmap/hashmap.c
  deps/vec/vec.c
)

set(BUILD_INCLUDE_DIRS 
  ./deps/buffer
  ./deps/vec
  ./deps/templated-hashmap/
)

# Note that exe does not represent Windows' 
# exe its just short hand of executable 
#
# Note:
# Still creates executable even building library. 
# This would contain test codes if project is 
# library. The executable directly links to the 
# library objects instead through shared library
set(BUILD_EXE_SOURCES
  src/specials.c
  src/premain.c
  src/main.c
)

# Public header to be exported
# If this a library
set(BUILD_PUBLIC_HEADERS
  include/dummy.h
)

set(BUILD_PROTOBUF_FILES
  src/format/bytecode.proto
)

set(BUILD_CFLAGS "")
set(BUILD_LDFLAGS "")

# AddPkgConfigLib is in ./buildsystem/CMakeLists.txt
macro(AddDependencies)
  # Example
  # AddPkgConfigLib(FluffyGC FluffyGC>=1.0.0)
  
  link_libraries(-lm -lprotobuf-c)
endmacro()


