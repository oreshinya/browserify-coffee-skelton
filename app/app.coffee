fs = require 'fs'

Vue.component "hoge",
  template: fs.readFileSync "#{__dirname}/views/hoge.html", "utf8"

$ ->
  app = new Vue
    el: "#app"
    data:
      currentView: "hoge"
