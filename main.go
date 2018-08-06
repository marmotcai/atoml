package main

import (
	"fmt"
	"bytes"

	"github.com/ipfs/go-ipfs-api"

	_ "github.com/marmotcai/atoml/src/routers"
	"github.com/astaxie/beego"
)

const (
	shellUrl     = "localhost:5001"
)

var sh *shell.Shell

func main() {

	sh = shell.NewShell(shellUrl)
	mhash, err := sh.Add(bytes.NewBufferString("Hello IPFS Shell tests"))
	if err != nil {
		fmt.Println("连接IPFS服务失败，请启动'ipfs daemon --offline'")
	//	return
	}
	fmt.Println(mhash)

	beego.Run()
}

