set -e
dotnet restore || echo "Error: dependency restoration failed (see output above)."
rm -rf bin buildlog-* publog-* logs || echo "Error: removal of binaries, build logs, and publishing logs failed."
declare -a runtimes=("win7-x64" "win7-x86" "win8-x64" "win8-x86" "win81-x64" "win81-x86" "win10-x64" "win10-x86" "rhel.7-x64" "ubuntu.14.04-x64" "ubuntu.14.10-x64" "ubuntu.15.04-x64" "ubuntu.15.10-x64" "ubuntu.16.04-x64" "ubuntu.16.10-x64" "centos.7-x64" "debian.8-x64" "fedora.23-x64" "fedora.24-x64" "opensuse.13.2-x64" "opensuse.42.1-x64" "ol.7-x64" "ol.7.0-x64" "ol.7.1-x64" "ol.7.2-x64" "linuxmint.17-x64" "linuxmint.17.1-x64" "linuxmint.17.2-x64" "linuxmint.17.3-x64" "linuxmint.18-x64" "osx.10.10-x64" "osx.10.11-x64" "osx.10.12-x64") || echo "Error: Declaration of runtimes array failed."
mkdir -p logs/publish logs/build || echo "Error: cannot create logs directory."
for i in "${runtimes[@]}"
do
MSPARAMS="/nologo /noconsolelogger /fileLogger /fileloggerparameters:LogFile=logs/build/buildlog-$i.log;PerformanceSummary;Summary;ShowCommandLine;ShowTimestamp;ShowEventId;verbosity=normal"
echo "Building stopwatch for runtime $i..."
dotnet build --configuration release --runtime $i --verbosity quiet $MSPARAMS || echo "Error: dotnet build failed (see log file buildlog-$i.log for details)."
done
echo "All runtimes built. Would you like to publish these builds? [ [y]es, any other entry for no. ]"
read $PUB || echo "Error: STDIN read failed."
if [ $PUB=="y" ]; then
for i in "${runtimes[@]}"
do
MSPARAMS="/nologo /noconsolelogger /fileLogger /fileloggerparameters:LogFile=logs/publish/publog-$i.log;PerformanceSummary;Summary;ShowCommandLine;ShowTimestamp;ShowEventId;verbosity=normal"
echo "Publishing stopwatch for runtime $i..."
dotnet publish --configuration release --runtime $i --verbosity quiet $MSPARAMS || echo "Error: dotnet publish failed (see log file publog-$i.log for details)."
done
else
echo "Exiting without publication of binary builds."
exit 0
fi
echo "All tasks completed. Exiting."
exit 0