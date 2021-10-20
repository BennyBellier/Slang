# Slang
  Simplify the way you manage your project tree and your makefile with this simple script, at any time.

### Contact Info
  > @BennyBellier
### Build Status
Main branch overall build status: [![Build Status](https://dev.azure.com/bennybellier/Slang/_apis/build/status/bennybellier.slang?branchName=master)](https://dev.azure.com/bennybellier/Slang/_build/latest?definitionId=1&branchName=master)

|Platform       |Build Status|
|            --:|:--         |
|Linux          |[![Build Status](https://dev.azure.com/bennybellier/Slang/_apis/build/status/bennybellier.slang?branchName=master&jobName=Linux%20Build)](https://dev.azure.com/bennybellier/Slang/_build/latest?definitionId=1&branchName=master)|
|Mac            |[![Build Status](https://dev.azure.com/bennybellier/Slang/_apis/build/status/bennybellier.slang?branchName=master&jobName=Mac%20Build)](https://dev.azure.com/bennybellier/Slang/_build/latest?definitionId=1&branchName=master)|
|Windows Debug  |[![Build Status](https://dev.azure.com/bennybellier/Slang/_apis/build/status/bennybellier.slang?branchName=master&jobName=Windows%20Build&configuration=Windows%20Build%20Debug)](https://dev.azure.com/bennybellier/Slang/_build/latest?definitionId=1&branchName=master)|
|Windows Release|[![Build Status](https://dev.azure.com/bennybellier/Slang/_apis/build/status/bennybellier.slang?branchName=master&jobName=Windows%20Build&configuration=Windows%20Build%20Release%20with%20Release%20Installer)](https://dev.azure.com/bennybellier/Slang/_build/latest?definitionId=1&branchName=master)|

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
📦All-in-One # Project folder
 ┣ 📂.git
 ┣ 📂bin        # containing executive files
 ┃ ┣ 📂debug    # folder containing the debug executable version
 ┃ ┗ 📂release  # folder containing the release executable version
 ┣ 📂build      # folder containing .o files to generate debug and build versions
 ┣ 📂dev
 ┃ ┣ 📂assets   # folder containing the project assets
 ┃ ┣ 📂include  # folder containing the header files (.h)
 ┃ ┗ 📂src      # folder containing the source files (.c, etc)
 ┣ 📜.gitignore
 ┣ 📜LICENCE
 ┣ 📜MakeFile
 ┗ 📜README.md
```
## Divorce Version
```sh
📦Divorce # Project folder
 ┣ 📂.git
 ┣ 📂assets     # folder containing the project assets
 ┣ 📂bin        # containing executive files
 ┃ ┣ 📂debug    # folder containing the debug executable version
 ┃ ┗ 📂release  # folder containing the release executable version
 ┣ 📂build      # folder containing .o files to generate debug and build versions
 ┣ 📂include    # folder containing the header files (.h)
 ┣ 📂src        # folder containing the source files (.c, etc)
 ┣ 📜.gitignore
 ┣ 📜LICENCE
 ┣ 📜MakeFile
 ┗ 📜README.md
```

## Pairwise version
```sh
📦Pairwise # Project folder
 ┣ 📂.git
 ┣ 📂bin        # containing executive files
 ┃ ┣ 📂debug    # folder containing the debug executable version
 ┃ ┗ 📂release  # folder containing the release executable version
 ┣ 📂build      # folder containing .o files to generate debug and build versions
 ┣ 📂dev        # each source is stored by pair header and .c in one folder
 ┃ ┣ 📂assets   # folder containing the project assets
 ┃ ┣ 📂foo      # folder containing pair of header and .c files
 ┃ ┃ ┣ 📜foo.c
 ┃ ┃ ┗ 📜foo.h
 ┃ ┗ 📜main.c
 ┣ 📜.gitignore
 ┣ 📜LICENCE
 ┣ 📜MakeFile
 ┗ 📜README.md
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
- [ ] Export to be usable on MS Windows and MacOS