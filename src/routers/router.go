package routers

import (
	"github.com/marmotcai/atoml/atoml/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
