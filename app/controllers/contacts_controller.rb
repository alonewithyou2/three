class ContactsController < ApplicationController
   def new
      #instant variable if it has a @ symbol
      @contact = Contact.new
   end
   
   def create
      @contact = Contact.new(contact_params)
      if @contact.save
         redirect_to new_contact_path, notice: "Comment sent!"
      else
         redirect_to new_contact_path, notice: "Error occured, please check that all forms are filled"
      end
   end
   
   #security feature
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
      
end