require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, Rails.application.secrets.SPOT_ID, Rails.application.secrets.SPOT_SECRET, scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
