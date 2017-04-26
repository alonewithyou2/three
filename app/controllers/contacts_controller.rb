class ContactsController < ApplicationController
   
   # GET request to /contact-us, which is a custom route we made for this request
   #Show new contact form
   def new
      #instance variable if it has a @ symbol
      #creates an object that has name: , email:, and comments: with NO values yet
      #creates a blank object: name, email, comments
      #instance variables can be used in the views folder 
      @contact = Contact.new
   end
   
   #create the object in the machines memory, save it to the machine's database
   #This is a POST request /contacts
   def create
      #mass assignment of form fields into Contact object
      @contact = Contact.new(contact_params) #[error, error2] the error will be in an array
      #Save the Contact object to database
      if @contact.save
         #STORE FORM FIELDS VIA PARAMETERS, INTO VARIABLES
         #lift things from form field
         #this is saying "hey go into the contact form after it has been saved and
         #grab the name the customer put in, and the email and the comments"
         #and store them in the 'name', 'email', and 'body' variable and use those
         #variables on line 22 when we deliver that email or message.
         #key value pair, the key is the 'contact' and their are currently 3 values in it,
         #which is name, email, and comments. and we can decide which value we want when we type
         #:name, or :email, or :comments, each being a value of the key ':contact'
         #the below is a nested hash, contact is one hash, and the name is a nested hash inside the hash
         
         #contact is the key which holds all of the name, email, and comments, and the name
         #is also a key which holds the value of a somebody's name, then assign it to a variable
         name = params[:contact][:name]
         email = params[:contact][:email]
         body = params[:contact][:comments]
         
         #This sends the email to us, to andy.le007@yahoo.com, this is called an object
         #that is coming to 'life'
         #Plug variables into Contact Mailer email method and send email
         ContactMailer.contact_email(name, email, body).deliver
         
         #Store success message in flash hash so it can be displayed
         #save it to a flash hash, similar to params hash with key value pairs.
         #in this case we say that success is assigned to the value "message sent."
         flash[:success] = "Message sent."
         #redirect to the 'new' action up top
         redirect_to new_contact_path
      else
         #If Contact object doesnt save,
         #store errors in flash hash,
         #and redirect to the new action
         flash[:danger] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
   end
   
   #security feature
   private
      #to collect data from form, we need to use
      #'strong' parameters and whitelist the form fields
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
      
end