Hardened_malloc
===============

[GrapheneOS](https://github.com/GrapheneOS/hardened_malloc)'s hardened memory allocator.

Divergence from upstream
------------------------

* Ragnarok uses three config variants:
	* `Strong`: same as upstream's [default](https://github.com/GrapheneOS/hardened_malloc/blob/main/config/default.mk) variant.
	* `Light`: same as upstream's [light](https://github.com/GrapheneOS/hardened_malloc/blob/main/config/default.mk) variant.
	* `Medium`: middle ground between `strong` and `light`. Built on the light variant, but sets __CONFIG_WRITE_AFTER_FREE_CHECK__ and __CONFIG_SLOT_RANDOMIZE__ to *true*, like in the `strong` variant. This is the default variant on Ragnarok.
* Code divergence: none.

Ragnarok's implementation
-------------------------

The `ld.so.preload` trick is used to make hardened_malloc supersede glibc's malloc.
`/lib/libhardened_malloc.so`, which points to `/lib/hardedned_malloc/libhardened_malloc-medim.so`,
is added to `/etc/ld.so.preload`.

The default variant used can be changed by modifying the symlink, e.g.

	```
	ln -sf /lib/hardened_malloc/libhardened_malloc-strong.so /lib/libhardened_malloc.so
	```
