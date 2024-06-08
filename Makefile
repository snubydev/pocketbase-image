VERSION := "0.22.13"
URL := https://github.com/pocketbase/pocketbase/releases/download/v$(VERSION)/pocketbase_$(VERSION)_linux_amd64.zip
FILE := $(shell basename $(URL))

download:
	wget -N $(URL) \
		&& unzip -q -o $(FILE) \
		&& mkdir -p pb_public

image:
	docker build -t snubydev/pocketbase:$(VERSION) --progress plain --no-cache .
