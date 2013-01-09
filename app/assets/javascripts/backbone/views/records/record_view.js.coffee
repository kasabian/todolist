Todolist.Views.Records ||= {}

class Todolist.Views.Records.RecordView extends Backbone.View
  template: JST["backbone/templates/records/record"]
  events :
     "click .up_priority" : "up_priority"
     "click .remove_fild" : "destroy"
     "click .edit_fild" : "edit_record_title"
     "click .change_record_title" : "set_record_name"
     "click .check" : "set_check" 
  set_check: (el) =>
    c = 1
    if @.$(".check").attr("checked") != "checked" 
      c=0
    @model.set("check":c)
    @model.unset_save()  
  
  up_priority: (el) =>
    @model.set("priority": @model.get("priority")+1.01)
    @model.unset_save()
    $(".hiden_fild").change()
  
  edit_record_title: (el) -> 
    @model.show_record_title_modal(@)
   
  set_record_name: (el) ->
    @model.set_record_title_with_modal(@)
    @model.hide_record_title_modal(@)  
    @render()    
  
  destroy: ->
   if confirm("Вы уверены?")
     @model.destroy()
     $(".hiden_fild").change()
     

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    return this