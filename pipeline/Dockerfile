FROM alpine:latest as pre-build
COPY ./helloworld.txt ./code/helloworld.txt
RUN echo "this is a PRE-BUILD step"

FROM alpine:latest as build
COPY --from=pre-build ./code/helloworld.txt ./build/helloworld.txt
RUN echo "this is a build step"

FROM alpine:latest as test
COPY --from=build ./build/helloworld.txt ./test/helloworld.txt
RUN echo "this is a test step"
