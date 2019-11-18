
Debian
====================
This directory contains files used to package wienchaind/wienchain-qt
for Debian-based Linux systems. If you compile wienchaind/wienchain-qt yourself, there are some useful files here.

## wienchain: URI support ##


wienchain-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install wienchain-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your wienchain-qt binary to `/usr/bin`
and the `../../share/pixmaps/wien.ico` to `/usr/share/pixmaps`

wienchain-qt.protocol (KDE)

