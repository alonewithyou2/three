class ContactsController < ApplicationController
   def new
      #instance variable if it has a @ symbol
      #creates an object that has name: , email:, and comments: with NO values yet
      @contact = Contact.new
   end
   
   def create
      @contact = Contact.new(contact_params) #[error, error2] the error will be in an array
      if @contact.save
         flash[:sucess] = "Message sent."
         redirect_to new_contact_path
      else
         flash[:error] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
   end
   
   #security feature
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
      
end