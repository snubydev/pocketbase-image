FROM alpine AS build
ARG PB_VERSION=0.0.1
RUN apk update && apk add --no-cache ca-certificates unzip wget && rm -rf /var/cache/apk/*
WORKDIR /tmp
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${PB_VERSION}_linux_amd64.zip -d /pb/
RUN ls -la /pb


FROM alpine
RUN apk update && apk add --no-cache ca-certificates && rm -rf /var/cache/apk/*
COPY --from=build /pb/pocketbase /pocketbase
# Uncomment for custopm static frontend
#    COPY --from=build /pb/pb_public /pb_public
EXPOSE 8090
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb_data", "--publicDir=/pb_public"]
