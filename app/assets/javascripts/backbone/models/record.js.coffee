class Todolist.Models.Record extends Backbone.Model
  paramRoot: 'record'

  defaults:
    check: 0 
    priority: 0.00
    title: null 
    list_id: null
    
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
    a = e.$(".title_task_fild").attr("value")
    e.model.set({"title":a})
    @unset_save()
 
 
class Todolist.Collections.RecordsCollection extends Backbone.Collection
  model: Todolist.Models.Record
  url: '/records'
        
  set_round_priority: ->
   i=0
   @.each (m) =>
    @models[i].set("priority":i)
    i++
   
   
