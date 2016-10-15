window.App ||= {}

App.init = ->
  console.log("app hit init")

$(document).on "turbolinks:load", ->
  App.init()