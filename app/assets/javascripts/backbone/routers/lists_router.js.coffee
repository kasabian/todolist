class Todolist.Routers.ListsRouter extends Backbone.Router
  
  initialize: (options) ->
    @lists = new Todolist.Collections.ListsCollection()
    @lists.reset options.lists

  routes:
  
    "index"    : "index"
    ".*"        : "index"

  index: ->
    @view = new Todolist.Views.Lists.IndexView(lists: @lists)
    $("#lists").html(@view.render().el)

  