package = "ohm"
version = "0.1-1"

source = {
  url = "git://github.com/antirek/ohm.lua.git",
  branch = "master"
}

description = {
  summary = "",
  homepage = "",
  maintainer = "",
  license = ""
}

dependencies = {
  "lua ~> 5.1",
  "lua-cmsgpack",
  "lsocket",
  "json-lua"
}

build = {
  type = "builtin",
  modules = {
    ["ohm"] = "ohm.lua",
  },
  install = {
    lua = {
      ["ohm"] = "ohm.lua",
    }
  }
}
