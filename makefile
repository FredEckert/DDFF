LIBS=kernel32.lib user32.lib

CL_OPTIONS=/Fo$@ /EHsc /DUNICODE /DBOOST_ALL_NO_LIB /c /Ox /Zi /I$(BOOST_ROOT)
LINK_OPTIONS=/OUT:$@ $(LIBS) 


ddff.obj: ddff.cpp
	cl.exe ddff.cpp $(CL_OPTIONS)

utils.obj: utils.cpp
	cl.exe utils.cpp $(CL_OPTIONS)

sha512.obj: sha512.cpp
	cl.exe sha512.cpp $(CL_OPTIONS)

u64.obj: u64.c
	cl.exe u64.c $(CL_OPTIONS)

ddff.exe: ddff.obj utils.obj sha512.obj u64.obj
#	link.exe $** /SUBSYSTEM:CONSOLE /DEBUG /PDB:1.pdb $(LINK_OPTIONS)
	link.exe $** /SUBSYSTEM:CONSOLE /DEBUG $(LINK_OPTIONS)

all: ddff.exe

clean:
	del *.exe *.obj *.pdb
