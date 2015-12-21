class ContactMailer < ApplicationMailer
	default from: 'root@motorsjo.com'
 
  def contact_email(name,email,message,carid,owner)
    @name = name
    @email  = email
    @message = message
    @carid = carid
    @owner = owner
    mail(to: @owner.email, subject: 'Someone is Interseted in your car')
  end
end
