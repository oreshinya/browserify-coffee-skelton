Vue.component "hoge",
  template: require "./views/hoge.html"

$ ->
  app = new Vue
    el: "#app"
    data:
      currentView: "hoge"
