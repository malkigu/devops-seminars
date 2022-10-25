FROM alpine:latest as pre-build
COPY ./hello.txt ./code/hello.txt
RUN echo "this is a PRE-BUILD phase"

FROM alpine:latest as build
COPY --from=pre-build ./code/hello.txt ./build/hello.txt
RUN echo "this is a build phase"

FROM alpine:latest as test
COPY --from=build ./build/hello.txt ./test/hello.txt
RUN echo "this is a test phase"

FROM alpine:latest as security
RUN echo "this is a security phase"

FROM alpine:latest as back-end
RUN echo "this is a back-end phase"

FROM alpine:latest as front-end
RUN echo "this is a front-end phase"

FROM alpine:latest as deploy
RUN echo "some deployment - sh s3 cp src dst"

FROM alpine:latest as post
RUN echo "clear environment"
