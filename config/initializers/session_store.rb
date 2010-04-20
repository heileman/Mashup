# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mashup_session',
  :secret      => '56dcd4cf007989cd1d5cf88714cbd97c8bc66c82ade96c479154137a6cc840930eff735de84af7cadf9e2daa33ea97c1c7a1b50a230a3c892fff304d959f0510'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
