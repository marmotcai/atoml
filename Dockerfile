FROM golang

COPY ../../beego/ /go/src/github.com/beego/
COPY . /go/src/github.com/marmotcai/atoml/

WORKDIR /go/src/github.com/marmotcai/atoml/src

RUN go build

EXPOSE 8080

CMD ["./atoml"]
