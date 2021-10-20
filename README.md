# Slang
  Simplify the way you manage your project tree and your makefile with this simple script, at any time.
### Contact Info
  > @BennyBellier
## Installation
Run this command ton install Slang
```sh
git clone https://github.com/BennyBellier/Slang.git
cd Slang
./install.sh
```
## Usage
```sh
slang -h # show usages
```
The script applies the right executable's extension depending on which OS you are :
* `none` for Linux
* `.exe` for Windows
* `.app` for MacOS

### Use in already start project
If you decided to use Slang in an already started project, be aware, that your `makefile will be regenerate`. All of your executable where stocked in `bin/debug/`. And it will `initialise git repository` if it **not already exist**.

# Trees
## ALL-in-One Version
```sh
Project_Folder
├── bin/        # containing executive files
|  ├── release/ # folder containing the release executable version
|  └── debug/   # folder containing the debug executable version
├── build/      # folder containing .o files to generate debug and build versions
├── dev/
|  ├── assets/  # folder containing the project assets
|  ├── include/ # folder containing the header files (.h)
|  └── src/     # folder containing the source files (.c, etc)
|
├── .gitignore
├── LICENCE
├── Makefile
└── README.md
```
## Divorce Version
```sh
Project_Folder
├── bin/          # containing executive files
|  ├── release/   # folder containing the release executable version
|  └── debug/     # folder containing the debug executable version
├── build/        # folder containing .o files to generate debug and build versions
├── assets/       # folder containing the project assets
├── include/      #  folder containing the header files (.h)
├── src/          # folder containing the source files (.c, etc)
|
├── .gitignore
├── LICENCE
├── Makefile
└── README.md
```

## Pairwise version
```sh
Project_Folder
├── bin/        # containing executive files
|  ├──release/  # folder containing the release executable version
|  └──debug/    # folder containing the debug executable version
├── build/      # folder containing .o files to generate debug and build versions
├── dev/        # Each source is stored by pair header and .c in one folder
|  ├── assets/  # folder containing the project assets
|  ├── Foo/     # folder containing pair of header and .c files
|  | ├── foo.h
|  | └── foo.c
|  └── main.c
|
├── .gitignore
├── LICENCE
├── Makefile
└── README.md
```


# Avancements
- [X] define trees
- [ ] tree generation
- [ ] tree restructuring (move also files in directories)
- [ ] browse source files and headers
- [ ] generate the makefile with the inclusions contained in the files
- [ ] modification of the makefile accordingly to tree structure
- [ ] Generation of a empty couple : source files + header
- [ ] Automatic generation in a project already started
- [ ] create human readable information
- [ ] Create man page