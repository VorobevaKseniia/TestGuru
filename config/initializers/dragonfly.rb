require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "810671f239c7c937e7dd05b405c0bacc1e9198f5a5ac1071c37cab6060554d38"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
