class ContactsController < ApplicationController
   def new
      #instance variable if it has a @ symbol
      #creates an object that has name: , email:, and comments: with NO values yet
      #creates a blank object: name, email, comments
      @contact = Contact.new
   end
   
   #create the object in the machines memory, save it to the machine's database
   def create
      @contact = Contact.new(contact_params) #[error, error2] the error will be in an array
      if @contact.save
         flash[:success] = "Message sent."
         redirect_to new_contact_path
      else
         #UNDERSTANDING THE #FLASH - 
         flash[:danger] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
   end
   
   #security feature
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
      
end