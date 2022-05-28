m = Map("natfrpc", "SakuraFrp") 
m.description = translate("SakuraFrp 内网穿透")

m:section(SimpleSection).template  = "natfrpc/natfrpc_status"

s = m:section(TypedSection, "natfrpc")
s.addremove = false
s.anonymous = true

enabled = s:option(Flag, "enabled", translate("开启"))
enabled.default = 0
enabled.rmempty = false

command = s:option(Value, "command", translate("启动参数"))
command.rmempty = false
command.default = "--update -f"
command.description = translate("SakuraFrp启动参数，请查阅SakuraFrp官方帮助文档：<br />https://doc.natfrp.com")

downloadurl = s:option(Value, "downloadurl", translate("下载地址"))
downloadurl.rmempty = false
downloadurl.default = "https://getfrp.sh/d/frpc_linux_mipsle"
downloadurl.description = translate("SakuraFrp下载地址，请在SakuraFrp官方获取下载地址：<br />https://www.natfrp.com/tunnel/download")

run = s:option(Button, "run_button", translate("启动"))
run.inputstyle = "apply"
function run.write(self, section)
	io.popen("/etc/init.d/natfrpc start")
end

stop = s:option(Button, "stop_button", translate("关闭"))
stop.inputstyle = "remove"
function stop.write(self, section)
	io.popen("/etc/init.d/natfrpc stop")
end

update = s:option(Button, "update_button", translate("更新"))
update.inputtitle = translate("更新")
update.inputstyle = "reload"
update.description = translate("下载SakuraFrp或强制更新SakuraFrp")
function update.write(self, section)
	io.popen("/etc/natfrpc/download.sh >> /tmp/natfrpc.log 2>&1")
end

return m
