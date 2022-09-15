download:
	curl -L https://github.com/tdewolff/minify/releases/download/v2.9.24/minify_darwin_amd64.tar.gz > minify.tar.gz
	tar -xf minify.tar.gz

build: download
	./minify -r public -o .