Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :linkedin, ENV['LINKEDIN_API_KEY'], ENV['LINKEDIN_SECRET_KEY'], :scope => 'r_fullprofile r_emailaddress'
    provider :angellist, ENV['ANGELLIST_KEY'], ENV['ANGELLIST_SECRET']
    provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'], :scope => 'r_fullprofile r_emailaddress r_network'
  end

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    # SessionsController.action(:auth_failure).call(env)
  }
