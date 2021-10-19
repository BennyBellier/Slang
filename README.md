# Slang
  Simplify the way you manage your project tree and your makefile with this simple script
## Usage
```
./slang -h # show usages
```
## Trees
### ALL-in-One Version
```sh
bin/ # containing executive files
  | release/  # folder containing the release executable version
  | debug/    # folder containing the debug executable version
assets/
  | # folder containing the project assets
build/
  | # folder containing .o files to generate debug and build versions
src/
  | include/  # folder containing the header files (.h)
  | source/   # folder containing the source files (.c, etc)
.gitignore
LICENCE
Makefile
README.md
```
### Divorce Version
```sh
bin/ # containing executive files
  | release/  # folder containing the release executable version
  | debug/    # folder containing the debug executable version
assets/
  | # folder containing the project assets
build/
  | # folder containing .o files to generate debug and build versions
include/
  | # folder containing the header files (.h)
source/
  | # folder containing the source files (.c, etc)
.gitignore
LICENCE
Makefile
README.md
```

### Pairwise version
```sh
bin/ # containing executive files
  | release/  # folder containing the release executable version
  | debug/    # folder containing the debug executable version
assets/
  | # folder containing the project assets
build/
  | # folder containing .o files to generate debug and build versions
src/ # Each source is stored by pair header and .c in one folder
  | Foo/ # folder containing pair of header and .c files
    | foo.h
    | foo.c
  | main.c
.gitignore
LICENCE
Makefile
README.md
```


# Avancements
- [X] define trees
- [ ] browse source files and headers
- [ ] generate the makefile with the inclusions contained in the files
- [ ] modification of the tree structure and modification of the makefile accordingly
- [ ] Generation of source files + header
- [ ] Automatic generation in a project already started