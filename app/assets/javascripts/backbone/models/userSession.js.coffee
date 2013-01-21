
class Todolist.Models.UserSession extends Backbone.Model
  paramRoot: 'user'
  url: '/users/sign_in.json'
  
  defaults:
     email : null
     password : null
    

