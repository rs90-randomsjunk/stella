PRGNAME     = stella-od

EXESUFFIX = .elf
CC          = gcc
CXX          = g++


# add SDL dependencies
SDL_LIB     = 
SDL_INCLUDE = 
INCLUDES = -I./emucore -I./common

CFLAGS      = -O3 -g3 -Wall $(INCLUDES) 
CXXFLAGS    = $(CFLAGS) 
LDFLAGS     = -L$(SDL_LIB) $(CC_OPTS) -lstdc++ -lSDL 

# Files to be compiled
SRCDIR   =  ./emucore ./common ./opendingux .
VPATH    = $(SRCDIR)
SRC_C    = $(foreach dir, $(SRCDIR), $(wildcard $(dir)/*.c))
SRC_CP   = $(foreach dir, $(SRCDIR), $(wildcard $(dir)/*.cpp))
OBJ_C    = $(notdir $(patsubst %.c, %.o, $(SRC_C)))
OBJ_CP   = $(notdir $(patsubst %.cpp, %.o, $(SRC_CP)))
OBJS     = $(OBJ_C) $(OBJ_CP)

# Rules to make executable
$(PRGNAME)$(EXESUFFIX): $(OBJS)  
	$(CXX) $(CFLAGS) -o $(PRGNAME)$(EXESUFFIX) $^ $(LDFLAGS)


$(OBJ_C) : %.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ_CP) : %.o : %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(PRGNAME)$(EXESUFFIX) *.o
