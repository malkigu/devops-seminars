FROM alpine:latest as build
RUN echo "this is build step"
COPY ./file /code/file
RUN echo "hello" > /code/file

FROM alpine:latest as testing
RUN echo "this is testing....."
COPY --from-build /code/file ./testing/file
RUN ls -ltrh ./testing/
RUN cat ./testing/file
