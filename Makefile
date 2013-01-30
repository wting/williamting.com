OUTPUT = ./public
CC = pelican
CFLAGS = -s ./src/settings_build.py ./src -o ${OUTPUT}
SVBTLE = ./src/themes/svbtle/static/css

build_local: less
	@-rm -rf ${OUTPUT}
	sed 's:SITEURL_LOCAL:SITEURL:' < ./src/settings.py > ./src/settings_build.py
	${CC} ${CFLAGS}

build_public: less
	@-rm -rf ${OUTPUT}
	sed 's:SITEURL_PUBLIC:SITEURL:' < ./src/settings.py > ./src/settings_build.py
	${CC} ${CFLAGS}

less:
	lessc -x ${SVBTLE}/style.less > ${SVBTLE}/style.css

local: clean build_local
	${CC} ${CFLAGS} --autoreload &
	sleep 2s
	cd ${OUTPUT} && python -m SimpleHTTPServer

github: build_public
	ghp-import ${OUTPUT}
	git push origin gh-pages
	rm -fr ${OUTPUT}

public: clean build_public
	rsync -hvaxzlEP --stats --del ${OUTPUT}/ dh:~/blog.williamting.com/public/
	rm -fr ${OUTPUT}

clean:
	@-rm -rf public/
	@-killall pelican
