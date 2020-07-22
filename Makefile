SHELL := /bin/sh
MAJOR = 10
MINOR = 0
PATCH = 1

default: build

clean:
	rm -f qpdf-aws-lambda.zip
	rm -rf ./bin ./lib

build: clean
	wget https://github.com/qpdf/qpdf/releases/download/release-qpdf-$(MAJOR).$(MINOR).$(PATCH)/qpdf-$(MAJOR).$(MINOR).$(PATCH)-x86_64.AppImage -O qpdf.AppImage
	./qpdf.AppImage --appimage-extract
	mkdir -p ./bin ./lib
	cp -R squashfs-root/usr/bin/* ./bin/
	cp -R squashfs-root/usr/lib/* ./lib/
	chmod +x ./bin/*
	rm -rf squashfs-root qpdf.AppImage
	@zip -9 --filesync --recurse-paths qpdf-aws-lambda.zip bin/ lib/
