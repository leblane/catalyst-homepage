Unsplash.configure do |config|
  yml = YAML.load_file(Rails.root.join("config/unsplash.yml"))[Rails.env]

  config.application_access_key = yml['application_access_key']
  config.application_secret = yml['application_secret']
  config.application_redirect_uri = 'urn:ietf:wg:oauth:2.0:oob'
  config.utm_source = 'catalyst-homepage'
end


