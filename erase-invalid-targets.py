import os, shutil
print ("Scanning targets.")
targets = []
for f in os.listdir("bin/release/netcoreapp2.0"):
	if os.listdir("bin/release/netcoreapp2.0/{}".format(f)) == []:
		targets.append("bin/release/netcoreapp2.0/{}".format(f))

erase = input("{}/{} ({:.2f}%) targets will be erased. Continue? (y/n)".format(len(targets), len(os.listdir("bin/release/netcoreapp2.0")), (len(targets)/len(os.listdir("bin/release/netcoreapp2.0"))*100.0)))
if erase.upper()=="y".upper():
		for f in targets:
			shutil.rmtree(f)
		print ("All invalid targets erased.")
else:
		print ("Aborting.")
