# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/arion/Arvores/Trabalho2bi/trabalho2bi

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arion/Arvores/Trabalho2bi/build-trabalho2bi-Desktop_GCC-Debug

# Include any dependencies generated for this target.
include CMakeFiles/trabalho2bi.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/trabalho2bi.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/trabalho2bi.dir/flags.make

CMakeFiles/trabalho2bi.dir/main.c.o: CMakeFiles/trabalho2bi.dir/flags.make
CMakeFiles/trabalho2bi.dir/main.c.o: /home/arion/Arvores/Trabalho2bi/trabalho2bi/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arion/Arvores/Trabalho2bi/build-trabalho2bi-Desktop_GCC-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/trabalho2bi.dir/main.c.o"
	/usr/bin/gcc-8 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/trabalho2bi.dir/main.c.o   -c /home/arion/Arvores/Trabalho2bi/trabalho2bi/main.c

CMakeFiles/trabalho2bi.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/trabalho2bi.dir/main.c.i"
	/usr/bin/gcc-8 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/arion/Arvores/Trabalho2bi/trabalho2bi/main.c > CMakeFiles/trabalho2bi.dir/main.c.i

CMakeFiles/trabalho2bi.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/trabalho2bi.dir/main.c.s"
	/usr/bin/gcc-8 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/arion/Arvores/Trabalho2bi/trabalho2bi/main.c -o CMakeFiles/trabalho2bi.dir/main.c.s

# Object files for target trabalho2bi
trabalho2bi_OBJECTS = \
"CMakeFiles/trabalho2bi.dir/main.c.o"

# External object files for target trabalho2bi
trabalho2bi_EXTERNAL_OBJECTS =

trabalho2bi: CMakeFiles/trabalho2bi.dir/main.c.o
trabalho2bi: CMakeFiles/trabalho2bi.dir/build.make
trabalho2bi: CMakeFiles/trabalho2bi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arion/Arvores/Trabalho2bi/build-trabalho2bi-Desktop_GCC-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable trabalho2bi"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/trabalho2bi.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/trabalho2bi.dir/build: trabalho2bi

.PHONY : CMakeFiles/trabalho2bi.dir/build

CMakeFiles/trabalho2bi.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/trabalho2bi.dir/cmake_clean.cmake
.PHONY : CMakeFiles/trabalho2bi.dir/clean

CMakeFiles/trabalho2bi.dir/depend:
	cd /home/arion/Arvores/Trabalho2bi/build-trabalho2bi-Desktop_GCC-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arion/Arvores/Trabalho2bi/trabalho2bi /home/arion/Arvores/Trabalho2bi/trabalho2bi /home/arion/Arvores/Trabalho2bi/build-trabalho2bi-Desktop_GCC-Debug /home/arion/Arvores/Trabalho2bi/build-trabalho2bi-Desktop_GCC-Debug /home/arion/Arvores/Trabalho2bi/build-trabalho2bi-Desktop_GCC-Debug/CMakeFiles/trabalho2bi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/trabalho2bi.dir/depend

