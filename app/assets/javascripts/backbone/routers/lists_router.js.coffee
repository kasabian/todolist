class Todolist.Routers.ListsRouter extends Backbone.Router
  
  initialize: (options) ->
    @lists = new Todolist.Collections.ListsCollection()

  routes:
  
    "index"        : "index"
    "new_session"  : "new_session"
    "reg"          : "reg"
    ".*"           : "index"
    
  index: ->
    @lists.fetch()
    @view = new Todolist.Views.Lists.IndexView(lists: @lists)
    $("#lists").html(@view.render().el)
    
  new_session: -> 
   @view  = new Todolist.Views.User.authenticatedView() 
   $("#lists").html(@view.render().el)
  
  
  reg: -> 
   @view  = new Todolist.Views.User.registrationView() 
   $("#lists").html(@view.render().el) 
  


  