package routers

import (
	"github.com/marmotcai/atoml/stream/coding-platform/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
