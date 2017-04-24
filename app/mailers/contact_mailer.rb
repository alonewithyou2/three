#the '<' symbol means to 'inherit from', so the Contactmailer will 'inherit from'
#the ActionMailer
class ContactMailer < ActionMailer::Base
   default to: 'andy.le007@yahoo.com' 
   
   def contact_email(name, email, body)
       @name = name
       @email = email
       @body = body
       
       mail(from: email, subject: 'Contact Form Message')
       
   end
end