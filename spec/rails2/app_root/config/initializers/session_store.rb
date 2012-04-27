# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails2_session',
  :secret      => '4b0ff49e0f76b04769cf739a0262cbba2db396669d39c661fbdf9e5c62bc3c721706cde28ebe29ffe9c06bf1067d85fd62c29601f0984cb39c14406464ba287e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
