class ContactsController < ApplicationController
    before_action :require_user!
    # before_action :require_user!, only: %i(new create edit show update index destroy)

    def index
        contacts = current_user.contacts
        @sorted_contacts = contacts.sort_by{ |contact| contact.last_name.downcase  }
        render :index 
         # NOTE: by doing contacts = current_user.contacts this limits the index view to only the user's contacts
        #  instead ALL contacts by doing @contacts = contacts (all contacts in database)
        # only @sorted_contacts needs to be an instance variable because 
        # only instance variables can be passed to the view, local variables are not.
        # @sorted_contacts are contacts sorted alphabetically by last name, so the 
        # index view will go in alphabetical order, not by the order of when the contact
        # was generated. 
    end 

    def show
        @contact = Contact.find(params[:id])
        render :show 
        # render :show sends over the show TEMPLATE
        # does NOT call show method, or would be an infinite loop
        # calling the show SYMBOL not the method here
    end 

    def create
        @contact = current_user.contacts.new(contact_params)
        if @contact.save
            redirect_to contact_url(@contact) 
        else  
            flash.now[:errors] = @contact.errors.full_messages
            render :new
        end 
    end 

    def new
        # note: this shows the form, does not create a new contact
        # dummy contact object created to capture errors (if any) to display to user
        @contact = Contact.new 
        render :new 
    end 

    def update
        @contact = Contact.find(params[:id])
        # options for an update: update, update!, update_attributes, update_attributes!
        if @contact.update(contact_params)
           redirect_to contact_url(@contact)
        else  
            render :edit 
        end 
    end 

    def edit
        # show an edit form to update an existing contact object
        @contact = Contact.find(params[:id])
        render :edit
    end 

    def destroy
        # delete a contact
        # if we run a method and don't render or redirect, rails will render <name of method>
        @contact = Contact.find(params[:id])
        @contact.destroy
        redirect_to contacts_url 
    end 

    private
    def contact_params
        # either needs to be params[:contact] OR
        # if params are REQUIRED params.require(:contact).permit(). Require is a method, so ()
        # however require will make ALL parameters required
        params[:contact].permit(:first_name, :last_name, :email, :phone, :title, :company, :birth_date, :sex, :notes)
    end 
end 