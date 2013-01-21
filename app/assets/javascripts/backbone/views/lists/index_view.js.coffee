Todolist.Views.Lists ||= {}

class Todolist.Views.Lists.IndexView extends Backbone.View
  template: JST["backbone/templates/lists/index"]
  events: 
    "click .b_add_task": "add_task"
    "change .hiden_fild": "render"
    
  initialize: () ->
   @options.lists.bind('reset', @addAll) 


  add_task: (e) =>    
    model = new Todolist.Models.List
    model.set("name":"новый проект")
    @options.lists.push(model)
    model.save()    
    @render()
    
      
  addAll: () =>
    @options.lists.each(@addOne)
   
  addOne: (list) =>
    view = new Todolist.Views.Lists.ListView({model : list})
    @$(".task").append(view.render().el)
      
  
  
  render: =>
    $(@el).html(@template(lists: @options.lists.toJSON() ))
    @addAll()

    return this
  
  
  