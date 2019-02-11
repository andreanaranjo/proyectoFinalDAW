class ContactsMailer < ActionMailer::Base
    default from: "lauridoviviana@gmail.com"
    
    def general_message(contact)
      @contact = contact
      mail( :to => "lauridoviviana@gmail.com", :subject => "You Have a Message From Your Website")
    end
end