Todolist.Views.User ||= {}

class Todolist.Views.User.authenticatedView extends Backbone.View
  template: JST["backbone/templates/reg/authenticated_user"]
  
  events :
   'submit form': 'login'

  initialize: ->
   @model = new Todolist.Models.UserSession()
   
  login: (e) ->
   el = $(@el)
   e.preventDefault()
   pass = el.find('input#password').val()
   email = el.find('input#email').val()
   @model.set("email":email,"password":pass) 
   el.find('form .error').html("")   
   @model.save(@model.toJSON(),
      success: (userSession, response) =>
        Todolist.currentUser = new Todolist.Models.User(response)
        window.location.hash = "index"
      error: (userSession, response) =>
        el.find('form .error').html("")
        result = $.parseJSON(response.responseText)
        el.find('form .error').prepend(result.error)
        )
  
  
  render: =>
    $(@el).html(@template())
    return this
  
  