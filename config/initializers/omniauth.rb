Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :linkedin, ENV['LINKEDIN_API_KEY'], ENV['LINKEDIN_SECRET_KEY'], :scope => 'r_fullprofile r_emailaddress'
    provider :angellist, ENV['ANGELLIST_KEY'], ENV['ANGELLIST_SECRET']
  end

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
