
class Todolist.Models.UserReg extends Backbone.Model
  paramRoot: 'user'
  url: '/users.json'
  
  defaults:
     email : null
     password : null
     password_confirmation : null
  

    
 
   