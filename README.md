# How to use this overlay

## with local overlays

[Local overlays](https://wiki.gentoo.org/wiki/Overlay/Local_overlay) should be managed via `/etc/portage/repos.conf/`.
To enable this overlay make sure you are using a recent Portage version (at least `2.2.14`), and create a `/etc/portage/repos.conf/blx32.conf` file containing precisely:

```
[blx32]
location = /usr/local/portage/blx32
sync-type = git
sync-uri = https://github.com/gabrielmoura/blx32-overlay.git
priority=9999
```

Afterwards, simply run `emerge --sync`, and Portage should seamlessly make all our ebuilds available.

## with layman

Invoke the following:

	layman -f -o https://raw.githubusercontent.com/gabrielmoura/blx32-overlay/master/layman.xml -a blx32
	
Or read the instructions on the [Gentoo Wiki](http://wiki.gentoo.org/wiki/Layman#Adding_custom_repositories).
