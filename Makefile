OUTPUT = ./public
CC = pelican
CFLAGS = -s ./src/settings.py ./src -o ${OUTPUT}
SVBTLE = ./src/themes/svbtle/static/css

build: less
	@-rm -rf ${OUTPUT}
	${CC} ${CFLAGS}

less:
	lessc -x ${SVBTLE}/style.less > ${SVBTLE}/style.css

local: less
	${CC} ${CFLAGS} --autoreload &
	sleep 2s
	cd ${OUTPUT} && python -m SimpleHTTPServer

github: build less
	ghp-import ${OUTPUT}
	git push origin gh-pages
	rm -fr ${OUTPUT}

public: clean less build
	rsync -hvaxzlEP --stats --del ${OUTPUT}/ dh:~/williamting.com/public/
	rm -fr ${OUTPUT}
	git push all

clean:
	@-rm -rf public/
