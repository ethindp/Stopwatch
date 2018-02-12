import urllib.request, json
req = urllib.request.urlretrieve("https://raw.githubusercontent.com/dotnet/corefx/master/pkg/Microsoft.NETCore.Platforms/runtime.json")
with open(req[0], "r") as f:
	targets = json.loads(f.read())
runtimes = sorted(list(targets["runtimes"].keys()))
for runtime in runtimes:
	print(runtime)
