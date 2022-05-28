
module("luci.controller.natfrpc", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/natfrpc") then
		return
	end

	entry({"admin", "services", "natfrpc"},cbi("natfrpc"), _("SakuraFrp"), 30).dependent = true

	entry({"admin", "services", "natfrpc", "status"},call("act_status")).leaf=true
	
end

function act_status()
	local e={}
	e.running = luci.sys.call("pidof natfrpc > /dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end