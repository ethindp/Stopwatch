declare -a failures=()
declare -a pub_failures=()
declare -a runtimes=("alpine" "alpine-corert" "alpine-x64" "alpine-x64-corert" "alpine.3.6" "alpine.3.6-corert" "alpine.3.6-x64" "alpine.3.6-x64-corert" "android" "android-arm" "android-arm-corert" "android-arm64" "android-arm64-corert" "android-corert" "android.21" "android.21-arm" "android.21-arm-corert" "android.21-arm64" "android.21-arm64-corert" "android.21-corert" "any" "aot" "base" "centos" "centos-corert" "centos-x64" "centos-x64-corert" "centos.7" "centos.7-corert" "centos.7-x64" "centos.7-x64-corert" "corert" "debian" "debian-arm" "debian-arm-corert" "debian-arm64" "debian-arm64-corert" "debian-armel" "debian-armel-corert" "debian-corert" "debian-x64" "debian-x64-corert" "debian-x86" "debian-x86-corert" "debian.8" "debian.8-arm" "debian.8-arm-corert" "debian.8-arm64" "debian.8-arm64-corert" "debian.8-armel" "debian.8-armel-corert" "debian.8-corert" "debian.8-x64" "debian.8-x64-corert" "debian.8-x86" "debian.8-x86-corert" "debian.9" "debian.9-arm" "debian.9-arm-corert" "debian.9-arm64" "debian.9-arm64-corert" "debian.9-armel" "debian.9-armel-corert" "debian.9-corert" "debian.9-x64" "debian.9-x64-corert" "debian.9-x86" "debian.9-x86-corert" "fedora" "fedora-corert" "fedora-x64" "fedora-x64-corert" "fedora.23" "fedora.23-corert" "fedora.23-x64" "fedora.23-x64-corert" "fedora.24" "fedora.24-corert" "fedora.24-x64" "fedora.24-x64-corert" "fedora.25" "fedora.25-corert" "fedora.25-x64" "fedora.25-x64-corert" "fedora.26" "fedora.26-corert" "fedora.26-x64" "fedora.26-x64-corert" "fedora.27" "fedora.27-corert" "fedora.27-x64" "fedora.27-x64-corert" "fedora.28" "fedora.28-corert" "fedora.28-x64" "fedora.28-x64-corert" "gentoo" "gentoo-corert" "gentoo-x64" "gentoo-x64-corert" "linux" "linux-arm" "linux-arm-corert" "linux-arm64" "linux-arm64-corert" "linux-armel" "linux-armel-corert" "linux-corert" "linux-x64" "linux-x64-corert" "linux-x86" "linux-x86-corert" "linuxmint.17" "linuxmint.17-corert" "linuxmint.17-x64" "linuxmint.17-x64-corert" "linuxmint.17.1" "linuxmint.17.1-corert" "linuxmint.17.1-x64" "linuxmint.17.1-x64-corert" "linuxmint.17.2" "linuxmint.17.2-corert" "linuxmint.17.2-x64" "linuxmint.17.2-x64-corert" "linuxmint.17.3" "linuxmint.17.3-corert" "linuxmint.17.3-x64" "linuxmint.17.3-x64-corert" "linuxmint.18" "linuxmint.18-corert" "linuxmint.18-x64" "linuxmint.18-x64-corert" "linuxmint.18.1" "linuxmint.18.1-corert" "linuxmint.18.1-x64" "linuxmint.18.1-x64-corert" "linuxmint.18.2" "linuxmint.18.2-corert" "linuxmint.18.2-x64" "linuxmint.18.2-x64-corert" "linuxmint.18.3" "linuxmint.18.3-corert" "linuxmint.18.3-x64" "linuxmint.18.3-x64-corert" "linuxmint.19" "linuxmint.19-corert" "linuxmint.19-x64" "linuxmint.19-x64-corert" "ol" "ol-corert" "ol-x64" "ol-x64-corert" "ol.7" "ol.7-corert" "ol.7-x64" "ol.7-x64-corert" "ol.7.0" "ol.7.0-corert" "ol.7.0-x64" "ol.7.0-x64-corert" "ol.7.1" "ol.7.1-corert" "ol.7.1-x64" "ol.7.1-x64-corert" "ol.7.2" "ol.7.2-corert" "ol.7.2-x64" "ol.7.2-x64-corert" "ol.7.3" "ol.7.3-corert" "ol.7.3-x64" "ol.7.3-x64-corert" "ol.7.4" "ol.7.4-corert" "ol.7.4-x64" "ol.7.4-x64-corert" "opensuse" "opensuse-corert" "opensuse-x64" "opensuse-x64-corert" "opensuse.13.2" "opensuse.13.2-corert" "opensuse.13.2-x64" "opensuse.13.2-x64-corert" "opensuse.42.1" "opensuse.42.1-corert" "opensuse.42.1-x64" "opensuse.42.1-x64-corert" "opensuse.42.2" "opensuse.42.2-corert" "opensuse.42.2-x64" "opensuse.42.2-x64-corert" "opensuse.42.3" "opensuse.42.3-corert" "opensuse.42.3-x64" "opensuse.42.3-x64-corert" "osx" "osx-corert" "osx-x64" "osx-x64-corert" "osx.10.10" "osx.10.10-corert" "osx.10.10-x64" "osx.10.10-x64-corert" "osx.10.11" "osx.10.11-corert" "osx.10.11-x64" "osx.10.11-x64-corert" "osx.10.12" "osx.10.12-corert" "osx.10.12-x64" "osx.10.12-x64-corert" "osx.10.13" "osx.10.13-corert" "osx.10.13-x64" "osx.10.13-x64-corert" "rhel" "rhel-corert" "rhel-x64" "rhel-x64-corert" "rhel.6" "rhel.6-corert" "rhel.6-x64" "rhel.6-x64-corert" "rhel.7" "rhel.7-corert" "rhel.7-x64" "rhel.7-x64-corert" "rhel.7.0" "rhel.7.0-corert" "rhel.7.0-x64" "rhel.7.0-x64-corert" "rhel.7.1" "rhel.7.1-corert" "rhel.7.1-x64" "rhel.7.1-x64-corert" "rhel.7.2" "rhel.7.2-corert" "rhel.7.2-x64" "rhel.7.2-x64-corert" "rhel.7.3" "rhel.7.3-corert" "rhel.7.3-x64" "rhel.7.3-x64-corert" "rhel.7.4" "rhel.7.4-corert" "rhel.7.4-x64" "rhel.7.4-x64-corert" "sles" "sles-corert" "sles-x64" "sles-x64-corert" "sles.12" "sles.12-corert" "sles.12-x64" "sles.12-x64-corert" "sles.12.1" "sles.12.1-corert" "sles.12.1-x64" "sles.12.1-x64-corert" "sles.12.2" "sles.12.2-corert" "sles.12.2-x64" "sles.12.2-x64-corert" "sles.12.3" "sles.12.3-corert" "sles.12.3-x64" "sles.12.3-x64-corert" "tizen" "tizen-armel" "tizen-armel-corert" "tizen-corert" "tizen.4.0.0" "tizen.4.0.0-armel" "tizen.4.0.0-armel-corert" "tizen.4.0.0-corert" "ubuntu" "ubuntu-arm" "ubuntu-arm-corert" "ubuntu-arm64" "ubuntu-arm64-corert" "ubuntu-corert" "ubuntu-x64" "ubuntu-x64-corert" "ubuntu-x86" "ubuntu-x86-corert" "ubuntu.14.04" "ubuntu.14.04-arm" "ubuntu.14.04-arm-corert" "ubuntu.14.04-corert" "ubuntu.14.04-x64" "ubuntu.14.04-x64-corert" "ubuntu.14.04-x86" "ubuntu.14.04-x86-corert" "ubuntu.14.10" "ubuntu.14.10-arm" "ubuntu.14.10-arm-corert" "ubuntu.14.10-corert" "ubuntu.14.10-x64" "ubuntu.14.10-x64-corert" "ubuntu.14.10-x86" "ubuntu.14.10-x86-corert" "ubuntu.15.04" "ubuntu.15.04-arm" "ubuntu.15.04-arm-corert" "ubuntu.15.04-corert" "ubuntu.15.04-x64" "ubuntu.15.04-x64-corert" "ubuntu.15.04-x86" "ubuntu.15.04-x86-corert" "ubuntu.15.10" "ubuntu.15.10-arm" "ubuntu.15.10-arm-corert" "ubuntu.15.10-corert" "ubuntu.15.10-x64" "ubuntu.15.10-x64-corert" "ubuntu.15.10-x86" "ubuntu.15.10-x86-corert" "ubuntu.16.04" "ubuntu.16.04-arm" "ubuntu.16.04-arm-corert" "ubuntu.16.04-arm64" "ubuntu.16.04-arm64-corert" "ubuntu.16.04-corert" "ubuntu.16.04-x64" "ubuntu.16.04-x64-corert" "ubuntu.16.04-x86" "ubuntu.16.04-x86-corert" "ubuntu.16.10" "ubuntu.16.10-arm" "ubuntu.16.10-arm-corert" "ubuntu.16.10-arm64" "ubuntu.16.10-arm64-corert" "ubuntu.16.10-corert" "ubuntu.16.10-x64" "ubuntu.16.10-x64-corert" "ubuntu.16.10-x86" "ubuntu.16.10-x86-corert" "ubuntu.17.04" "ubuntu.17.04-arm" "ubuntu.17.04-arm-corert" "ubuntu.17.04-arm64" "ubuntu.17.04-arm64-corert" "ubuntu.17.04-corert" "ubuntu.17.04-x64" "ubuntu.17.04-x64-corert" "ubuntu.17.04-x86" "ubuntu.17.04-x86-corert" "ubuntu.17.10" "ubuntu.17.10-arm" "ubuntu.17.10-arm-corert" "ubuntu.17.10-arm64" "ubuntu.17.10-arm64-corert" "ubuntu.17.10-corert" "ubuntu.17.10-x64" "ubuntu.17.10-x64-corert" "ubuntu.17.10-x86" "ubuntu.17.10-x86-corert" "ubuntu.18.04" "ubuntu.18.04-arm" "ubuntu.18.04-arm-corert" "ubuntu.18.04-arm64" "ubuntu.18.04-arm64-corert" "ubuntu.18.04-corert" "ubuntu.18.04-x64" "ubuntu.18.04-x64-corert" "ubuntu.18.04-x86" "ubuntu.18.04-x86-corert" "unix" "unix-arm" "unix-arm-corert" "unix-arm64" "unix-arm64-corert" "unix-armel" "unix-armel-corert" "unix-corert" "unix-x64" "unix-x64-corert" "unix-x86" "unix-x86-corert" "win" "win-aot" "win-arm" "win-arm-aot" "win-arm-corert" "win-arm64" "win-arm64-aot" "win-arm64-corert" "win-corert" "win-x64" "win-x64-aot" "win-x64-corert" "win-x86" "win-x86-aot" "win-x86-corert" "win10" "win10-aot" "win10-arm" "win10-arm-aot" "win10-arm-corert" "win10-arm64" "win10-arm64-aot" "win10-arm64-corert" "win10-corert" "win10-x64" "win10-x64-aot" "win10-x64-corert" "win10-x86" "win10-x86-aot" "win10-x86-corert" "win7" "win7-aot" "win7-arm" "win7-arm-aot" "win7-arm-corert" "win7-arm64" "win7-arm64-aot" "win7-arm64-corert" "win7-corert" "win7-x64" "win7-x64-aot" "win7-x64-corert" "win7-x86" "win7-x86-aot" "win7-x86-corert" "win8" "win8-aot" "win8-arm" "win8-arm-aot" "win8-arm-corert" "win8-arm64" "win8-arm64-aot" "win8-arm64-corert" "win8-corert" "win8-x64" "win8-x64-aot" "win8-x64-corert" "win8-x86" "win8-x86-aot" "win8-x86-corert" "win81" "win81-aot" "win81-arm" "win81-arm-aot" "win81-arm-corert" "win81-arm64" "win81-arm64-aot" "win81-arm64-corert" "win81-corert" "win81-x64" "win81-x64-aot" "win81-x64-corert" "win81-x86" "win81-x86-aot" "win81-x86-corert")
function fail {
echo "Failure: $1"
exit 1
}
function failruntime {
failures+=($1)
}
set -e
echo "Removing existing artifacts."
rm -rf bin logs obj || fail "Error: removal of binaries, logs, and object code failed."
echo "Restoring dependencies."
dotnet restore -v q|| fail "Error: dependency restoration failed (see output above)."
mkdir -p logs/publish logs/build || fail "Error: cannot create logs directory."
for i in "${runtimes[@]}"
do
MSPARAMS="/nologo /noconsolelogger /binaryLogger:logs/build/$i.binlog;ProjectImports=Embed"
echo "Building stopwatch for runtime $i."
dotnet build --configuration release --runtime $i --verbosity quiet $MSPARAMS > /dev/null || failruntime $i
done
if [ ${#failures[@]} -eq 0 ]; then
echo No builds failed.
else
echo "The following ${#failures[@]} runtimes failed to build; see the log files associated with each runtime for more information."
for i in "${failures[@]}"
do
echo "$i"
rm -rf bin/$i
done
fi
echo "Would you like to publish these builds? [ [y]es, any other entry for no. ]"
read $PUB || fail "Error: STDIN read failed."
if [ $PUB=="y" ]; then
for i in "${runtimes[@]}"
do
MSPARAMS="/nologo /noconsolelogger /binaryLogger:logs/publish/$i.binlog;ProjectImports=Embed"
echo "Publishing stopwatch for runtime $i..."
dotnet publish --configuration release --runtime $i --verbosity quiet $MSPARAMS > /dev/null || failruntime $i
done
if [ ${#pub_failures[@]} -eq 0 ]; then
echo No builds failed.
else
echo The following ${#pub_failures[@]} runtimes failed to build:
for i in "${pub_failures[@]}"
do
echo $i
rm -rf bin/$i/publish
done
fi
else
echo "Exiting without publication of binary builds."
exit 0
fi
