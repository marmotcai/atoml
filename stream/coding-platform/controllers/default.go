package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "atoml.com"
	c.Data["Email"] = "caijun@atoml.com"
	c.TplName = "index.tpl"
}
