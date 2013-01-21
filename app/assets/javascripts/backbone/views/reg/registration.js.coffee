Todolist.Views.User ||= {}

class Todolist.Views.User.registrationView extends Backbone.View
  template: JST["backbone/templates/reg/registration_user"]
  
  events :
   'submit form': 'signed_up'

  initialize: ->
   @model = new Todolist.Models.UserReg()
   
  signed_up: (e) ->
   el = $(@el)
   e.preventDefault()
   pass = el.find('input#password').val()
   pass_c = el.find('input#password_confirmation').val()   
   email = el.find('input#email').val()
   @model.set("email":email,"password":pass,"password_confirmation":pass_c) 
   el.find('form .error').html("")
   @model.save(@model.toJSON(),
      success: (userSession, response) =>
        Todolist.currentUser = new Todolist.Models.User(response)
        window.location.hash = "index"
      error: (userSession, response) =>
        el.find('form .error').html("")
        result = $.parseJSON(response.responseText)
        _(result.errors).each (e, m) =>
         el.find('form .error').prepend( m+" : "+e[0]+"<br />")
        )
  
  
  render: =>
    $(@el).html(@template())
    return this