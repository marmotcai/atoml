package routers

import (
	"github.com/marmotcai/atoml/src/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
