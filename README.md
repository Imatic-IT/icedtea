# icedtea
Run browser to access old server IPMI interface

Sometimes you need to access some IPMI/ILO/iDrac (remote management) for servers, that are very old and they are using Java Web Start (.jnlp) technology to access web based KVM interface. 

If you don't want to mess with your desktop, you can use this docker-based image, which will for you run old brower with icedtea plugin

You can build it by ./build.sh and run it with ./run.sh

It was tested on Debian linux with Xserver.

You need to allow popups in browser and select "Icedtea" plugin for opening .jnlp files.

You can place files into volume/ folder to be accessed from browser (for example if you want to use virtual media functionality), files needs to be readable for user inside container (UID 1000)
