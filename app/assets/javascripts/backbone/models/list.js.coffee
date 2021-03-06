class Todolist.Models.List extends Backbone.Model
  paramRoot: 'list'

  defaults:
    name: ""
    
  validate: (attributes)=>
    errors = []
    if attributes.name.length > 50
     errors.push "name is too long"
    if attributes.name.length == 0 
     errors.push "name is too short" 
    if errors.length > 0
     return errors
 
  initialize: (options) =>
    @on('change:records', @parseRecords)
    @parseRecords()
 
  parseRecords: =>
    json = @get('records')
    if @records
     @records.reset(json)
    else
     @records = new Todolist.Collections.RecordsCollection(json)
    @records.comparator = (m) =>
     m.get("priority")
  
  show_task_name_modal: (e) ->
    $(".dark_fild").css("visibility","visible")
    a = $.trim(e.$(".title_task").html())
    e.$(".title_task_fild").attr("value": a)
    e.$(".list_modal").css("visibility","visible")
    
  hide_task_name_modal: (e) ->
    $(".dark_fild").css("visibility","hidden")
    e.$(".list_modal").css("visibility","hidden")
  
  set_task_name_with_modal: (e) ->
    a = $.trim e.$(".title_task_fild").attr("value")
    if a != ""  
     @.set({"name":a})
     @.unset('updated_at')
     @.unset('created_at')
     @.save("name":a)
    else alert("поле пустое!!!")  
    

class Todolist.Collections.ListsCollection extends Backbone.Collection
  model: Todolist.Models.List
  url: '/lists'
   

 