include ../buildconf.mk

LIB   	:= -lsyndicate -lsyndicate-ug -lfskit -lfskit_fuse -lprotobuf -lcurl
C_SRCS	:= $(wildcard *.c)
CXSRCS	:= $(wildcard *.cpp)

OBJDIR  := obj/
OBJ		:= $(patsubst %.c,$(BUILD_UG)/$(OBJDIR)/%.o,$(C_SRCS)) \
	       $(patsubst %.cpp,$(BUILD_UG)/$(OBJDIR)/%.o,$(CXSRCS))

UG_FUSE := syndicatefs
UG_FUSE_INSTALL := $(BINDIR)/$(UG_FUSE)
UG_FUSE_BUILD := $(patsubst %,$(BUILD_UG)/%,$(UG_FUSE))

DEFS := $(DEFS) -D_FILE_OFFSET_BITS=64

all: $(UG_FUSE_BUILD)

$(BUILD_UG)/$(UG_FUSE) : $(OBJ)
	mkdir -p "$(shell dirname "$@")"
	$(CPP) -o "$@" $(INC) "$<" $(LIBINC) $(LIB)

$(BUILD_UG)/$(OBJDIR)/%.o : %.c
	mkdir -p "$(shell dirname "$@")"
	$(CPP) -o "$@" $(INC) -c "$<" $(DEFS)

$(BUILD_UG)/$(OBJDIR)/%.o : %.cpp
	mkdir -p "$(shell dirname "$@")"
	$(CPP) -o "$@" $(INC) -c "$<" $(DEFS)

.PHONY: clean
clean:
	rm -f $(OBJ) $(GATEWAYS)

.PHONY: install 
install: $(UG_FUSE_INSTALL)

$(BINDIR)/%: $(BUILD_UG)/%
	mkdir -p "$(shell dirname "$@")"
	rm -f "$@"
	cp -a "$<" "$@"

.PHONY: uninstall
uninstall:
	rm -f $(UG_FUSE_INSTALL)

print-%: ; @echo $*=$($*)
