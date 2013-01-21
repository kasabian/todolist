Todolist.Views.Lists ||= {}

class Todolist.Views.Lists.ListView extends Backbone.View
  template: JST["backbone/templates/lists/list"]
  events:
    "click .edit_tsak_name" : "edit_task_name" 
    "click .change_list_name" : "set_task_name"
    "click .task_destroy" : "destroy"
    "click .add_record" : "add_record"
    
  add_record: () ->
    input_fild = @$(".new_record_fild") 
    if $.trim(input_fild.attr("value")) != "" 
     model = new Todolist.Models.Record
     priority = 0
     if @model.records.length != 0
      priority = @model.records.models[0].get("priority")-1
     model.set({"title":input_fild.attr("value"), "list_id":@model.get("id"),"priority": priority})
     if model.get("title") != ""
       @model.records.add(model)
     console.log model
     input_fild.attr("value":"")
     input_fild.focus()
     model.save(model.toJSON,
       success: (userSession, response) => 
        @render() 
        )
     
    else alert("Нужно заполнить поле!!!") 
    
  edit_task_name: (el) -> 
    @model.show_task_name_modal(@)
   
  set_task_name: (el) ->
    @model.set_task_name_with_modal(@)
    @model.hide_task_name_modal(@) 
    @model.set("name","")
    @render()
    
    
  destroy: () ->
    if confirm("Вы уверены?")
       @model.destroy()
       @remove()
  
  render: =>
    $(@el).html(@template(@model.toJSON() ))
    task = $(@el).find(".tasks")
    @model.records.sort(0)
    @model.records.set_round_priority()
    @model.records.each (record) =>
     r = new Todolist.Views.Records.RecordView ({model : record})
     task.append(r.render().el)
    return this
  
  
  