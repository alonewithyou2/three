#the '<' symbol means to 'inherit from', so the Contactmailer will 'inherit from'
#the ActionMailer, which is also another class itself
#and the ::Base means
#the contactmailer is just an arbitrary name that is appropriate for this class
#that we are making

#a class is basically chunk of code related to one thing
#in this case, this class is called the 'ContactMailer' and this relates to the
#contacts thing, which is sending out the email

#Object if this is brought to life
class ContactMailer < ActionMailer::Base
    
   #defining a rule, which sends the submitted 'object' to my e-mail address
   default to: 'andy.le007@yahoo.com' 
   
   #this is a function, a set of instructions for the machine to do,
   #functions in Ruby start with 'def', 
   #functions inside of a class is called a 'method', or 'action'
   #a class is like a blueprint, action, function, and method are basically synonymous
   def contact_email(name, email, body)
       
       #@name is basically a variable, like in c++
       #if you create a related view, you can use the instance variables in them
       #ex: in the views folder
       @name = name
       @email = email
       @body = body
       
       mail(from: email, subject: 'Contact Form Message')
       
   end
end