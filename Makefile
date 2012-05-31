OUTPUT = ./public
CC = pelican
CFLAGS = -s ./src/settings.py ./src -o ${OUTPUT}
SVBTLE = ./src/themes/svbtle/static/css

build: less
	#@-rm -rf ${OUTPUT}
	${CC} ${CFLAGS}

less:
	lessc -x ${SVBTLE}/style.less > ${SVBTLE}/style.css

reload: less
	${CC} ${CFLAGS} --autoreload

server:
	cd ${OUTPUT} && python -m SimpleHTTPServer

github: build less
	ghp-import ${OUTPUT}
	git push origin gh-pages
	rm -fr ${OUTPUT}

web: build less
	rsync -hvaxzlEP --stats --del ${OUTPUT}/ dh:~/williamting.com/public/
	rm -fr ${OUTPUT}
	git push all
