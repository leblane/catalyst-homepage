Unsplash.configure do |config|
  template = ERB.new File.new(Rails.root.join("config/unsplash.yml")).read
  yml = YAML.load(template.result(binding))[Rails.env]

  config.application_access_key = yml['application_access_key']
  config.application_secret = yml['application_secret']
  config.application_redirect_uri = 'urn:ietf:wg:oauth:2.0:oob'
  config.utm_source = 'catalyst-homepage'
end


