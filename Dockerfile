FROM alpine:latest as pre-build
COPY ./helloworld.txt ./code/helloworld.txt
RUN echo "this is a PRE-BUILD step"

FROM alpine:latest as build
COPY --from=pre-build ./code/helloworld.txt ./build/helloworld.txt
RUN echo "this is a build step"

FROM alpine:latest as test
COPY --from=build ./build/helloworld.txt ./test/helloworld.txt
RUN echo "this is a test step"

FROM alpine:latest as security
RUN echo "this is a security step"

FROM alpine:latest as back-end
RUN echo "this is the back-end"

FROM alpine:latest as front-end
RUN echo "this is the front-end"

FROM alpine:latest as deploy
RUN echo "this is a deployment step"

FROM alpine:latest as post
RUN echo "this is a post step"
