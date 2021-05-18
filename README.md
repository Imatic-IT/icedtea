# icedtea
Run browser to access old server IPMI interface

Sometimes you need to access some IPMI/ILO (remote management) for servers, that are very old and they are using Java Web Start (.jnlp) technology to access web based KVM interface. 

If you don't want to mess with your desktop, you can use this docker-based image, which will for you run old brower with icedtea plugin

You can build it by ./build and run it with ./run

It was tested on Debian linux with Xserver.

You need to allow popups in browser and select "Icedtea" plugin for opening .jnlp files.
