libdoctrine-inflector.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Doctrine libdoctrine-inflector

libdoctrine-inflector:
	bpc -v \
		-c bpc.conf  \
		-l doctrine-inflector \
		--input-file src.list

install-libdoctrine-inflector:
	cd Doctrine && bpc -l doctrine-inflector --install
