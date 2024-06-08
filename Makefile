VERSION := "0.22.13"

image:
	docker build --build-arg PB_VERSION=${VERSION} -t snubydev/pocketbase:$(VERSION) --progress plain --no-cache .
