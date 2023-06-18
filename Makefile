# COMMANDS
ifeq ($(OSTYPE),cygwin)
	CLEANUP=rm -f
	MKDIR=mkdir -p
	TARGET_EXTENSION=out
else ifeq ($(OS),Windows_NT)
	CLEANUP=del /F /Q
	MKDIR=mkdir
	TARGET_EXTENSION=exe
else
	CLEANUP=rm -f
	MKDIR=mkdir -p
	TARGET_EXTENSION=out
endif

# TESTS DIRECTORIES
UNITY_DIR=./Lib/UnityTest/unity.c
UTILS_DIR=./Lib/Utils/Utils.c
TEST_DIR=./Tests/Src

# DATA STRUCTURES DIRECTORIES
DS_DIR=./Src/DataStructures/Src

# DEFAULT DIRECTORIES
DEFAULT=${UNITY_DIR} ${UTILS_DIR}

# STACK
test_stack:
		gcc -o TestStack ${DEFAULT} ${TEST_DIR}/StackTests.c ${DS_DIR}/Stack.c 
		./TestStack

# QUEUE
test_queue:
		gcc -o TestQueue ${DEFAULT} ${TEST_DIR}/QueueTests.c ${DS_DIR}/Queue.c
		./TestQueue

# CLEAN
clean:
		${CLEANUP} TestStack