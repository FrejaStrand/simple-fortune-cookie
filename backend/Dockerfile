# build stage
FROM golang:1.19 as builder
WORKDIR /backend
COPY . /backend
ENV CGO_ENABLED=0
RUN go mod download && go mod verify
RUN cd /backend && go build -o gobackend

# run backend stage
FROM alpine
WORKDIR /backend
COPY --from=builder /backend/ /backend/
EXPOSE 9000
ENTRYPOINT ./gobackend