# build stage
FROM golang:1.19 as builder
WORKDIR /frontend
COPY . /frontend
ENV CGO_ENABLED=0
RUN go mod download && go mod verify
RUN cd /frontend && go build -o gofrontend

# run frontend stage
FROM alpine
WORKDIR /frontend
COPY --from=builder /frontend/ /frontend/
ENTRYPOINT ./gofrontend