# Stopwatch
A portable stopwatch written using .NET Core

## Build requirements

### Windows

* Download .NET core 1.0.3: https://go.microsoft.com/fwlink/?linkid=847097 (64-bit, EXE), https://go.microsoft.com/fwlink/?linkid=847091 (64-bit, ZIP), https://go.microsoft.com/fwlink/?linkid=847102 (32-bit, EXE), or https://go.microsoft.com/fwlink/?linkid=847092 (32-bit, ZIP) (or use a later version if one is available)
* Download InnoSetup 5.5.9 unicode: http://files.jrsoftware.org/is/5/innosetup-5.5.9-unicode.exe (or download InnoSetup studio 5.5.9 unicode: http://files.jrsoftware.org/ispack/innosetup-qsp-5.5.9-unicode.exe) (or use a later version if one is available)
* Download Cygwin (only base tools): https://cygwin.com/setup-x86.exe (32-bit) or https://cygwin.com/setup-x86_64.exe (64-bit systems)

### Mac OS X

Note: you will not be able to install InnoSetup or Cygwin on this platform. Software installation programs will not be buildable.

* Download .NET core 1.0.3: https://go.microsoft.com/fwlink/?linkid=847009 (64-bit, PKG) or https://go.microsoft.com/fwlink/?linkid=847094 (64-bit, GZIP TAR archive) (or any later version if one is available)

### Linux

Note: you will not be able to install InnoSetup or Cygwin on this platform. Software installation programs will not be buildable.

* Download .NET core (see https://www.microsoft.com/net/download/linux)

## Building

### Building the stopwatch itself

* Open a BASH shell (using cygwin (Windows) or Terminal (Mac OS X/Linux))
* Navigate to the directory where you wish to clone this repository (or, if this repository has already been cloned, navigate to the directory where it has been cloned)
* Ensure that the dotnet tools are in your PATH environment variable and that they are usable (try compiling a new project (`dotnet new console` and then `dotnet build` inside the project folder)).
* If dotnet is usable and is ready, re-navigate back to this repository's folder in your file system and run `./build.sh`.

### Building the installers

Note: Only for windows hosts!

* Open the setupfiles folder.
* Click on one of the .iss files to open it in InnoSetup or InnoSetup Studio.
* Go to the project menu and click 'compile'.

## Running the stopwatch
Go to `bin\release\netcoreapp<ncaver>\<target>` (or, if you published the build, navigate to `bin\release\netcoreapp<ncaver>\<target>\publish`) and click on `stopwatch.exe`, where `<ncaver>` is the .NET Core App version (like 1.1 or 1.0) and `<target>` is one of the RIDs available at https://docs.microsoft.com/en-us/dotnet/articles/core/rid-catalog.

## Contributing
If you'd like to contribute, simply send me a pull request and I'll add it. (Your pull request should be something useful, like fixing a bug, adding a new feature, etc. Useless code (like malicious code) will not be excepted.)

Have fun with the Stopwatch!