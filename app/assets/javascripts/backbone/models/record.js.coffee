class Todolist.Models.Record extends Backbone.Model
  paramRoot: 'record'

  defaults:
    check: 0 
    priority: 0.00
    title: ""
    list_id: null
    
    
  validate: (attributes)=>
    errors = []
    if attributes.title.length > 50 
     errors.push "name is too long"
    if attributes.title.length == 0 
     errors.push "name is too short" 
    if errors.length > 0
     errors
     
  unset_save: (e) ->
    @.unset('updated_at')
    @.unset('created_at')
    @.save()   
  
  show_record_title_modal: (e) ->
    $(".dark_fild").css("visibility","visible")
    a = $.trim(e.$(".s4").html())
    e.$(".title_task_fild").attr("value": a)
    e.$(".record_modal").css("visibility","visible")
    
  hide_record_title_modal: (e) ->
    $(".dark_fild").css("visibility","hidden")
    e.$(".record_modal").css("visibility","hidden")
  
  set_record_title_with_modal: (e) ->
    a =$.trim e.$(".title_task_fild").attr("value")
    if a != ""
     e.model.set({"title":a})
     @unset_save()
    else alert("поле пустое!!!") 
 
 
class Todolist.Collections.RecordsCollection extends Backbone.Collection
  model: Todolist.Models.Record
  url: '/records'
        
  set_round_priority: ->
   i=0
   @.each (m) =>
    @models[i].set("priority":i)
    i++
   
   
