# if Rails.env.production?
#   # Configure dkim globally (see above)
#   Dkim::domain      = 'motorsjo.com'
#   Dkim::selector    = 'mail'
#   Dkim::private_key = File.read('/etc/opendkim/keys/motorsjo.com/mail.private')
#   # This will sign all ActionMailer deliveries
#   ActionMailer::Base.register_interceptor(Dkim::Interceptor)
# end