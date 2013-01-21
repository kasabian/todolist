
class Todolist.Models.UserPasswordRecovery  extends Backbone.Model
  paramRoot: 'user'
  url: '/users/password.json'
  
  defaults:
     email : null

