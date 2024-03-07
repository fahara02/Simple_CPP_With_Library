

SRCDIR=./src
LIBDIR=./lib
OBJDIR=debug
BUILDDIR=./build

# Compilers definition.
CC = g++


# Compilers setting.
OPT_LEVEL=O0



# Files
SRCS := $(wildcard $(SRCDIR)/*.cpp) 
OBJS := $(SRCS:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

ONLYSRCS+=$(notdir $(foreach file, $(SRCDIR),$(wildcard $(SRCDIR)/*.cpp)))
BUILDOBJ+= $(addprefix $(BUILDDIR)/,$(patsubst %.cpp,%.o, $(ONLYSRCS)))


# Get all subdirectories of LIBDIR
SUBDIRS := $(wildcard $(LIBDIR)/*/)
INCFLAGS := $(addprefix -I,$(SUBDIRS))

# # Add this list to VPATH, the place make will look for the source files
VPATH = $(SRCDIR)

# Compiler flags
CFLAGS = -Wall -std=c++11 $(INCFLAGS)

# Executable
EXECUTABLE = $(BUILDDIR)/test.exe


# Targets
all: $(BUILDDIR) $(EXECUTABLE)
	@echo "Task completed"

$(BUILDDIR):
	@echo "Building" $<
	@if not exist "$(BUILDDIR)" mkdir "$(BUILDDIR)"

$(EXECUTABLE): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@	

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILDDIR)/%.o: $(LIBDIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@
	

clean:
	@echo "Cleaning......." $<
	@echo "$(BUILDOBJ)" $<
	@if exist "$(BUILDDIR)" (for %%i in ($(BUILDDIR)\*.o) do @del /Q "%%i")
	@if exist "$(BUILDDIR)" (for %%i in ($(BUILDDIR)\*.exe) do @del /Q "%%i")
	
	@if exist "$(BUILDDIR)" rmdir /s /q "$(BUILDDIR)"
	
	@echo "Cleaning done!" $<