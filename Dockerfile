FROM python:latest as builder
RUN echo "Installing.............."
WORKDIR /srcode
COPY ./test ./test
COPY ./srcode/* ./
RUN echo "Building APP!!"

FROM alpine:latest as unittest
WORKDIR /unittest
COPY --from=builder /srcode/test ./test
RUN echo "running the unittest " > ./test

FROM alpine:latest as security
WORKDIR /security
COPY --from=builder /srcode/* ./
COPY --from=unittest /unittest/test ./test
RUN echo "running the security check " >> ./test

FROM alpine:latest as emailrepo
WORKDIR /report
COPY --from=security /security/test ./test
RUN echo "running the security check " >> ./test

FROM alpine:latest as webapp
WORKDIR /code
COPY --from=builder /srcode/*.py ./
CMD ls ./
