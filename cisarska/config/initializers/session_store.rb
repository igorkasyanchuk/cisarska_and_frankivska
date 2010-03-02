# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_base_session',
  :secret      => '0ad594fb6e6c20c50b57ac195306b28b7beef3f552efa96cd1d90c1fec0e4f849b0de7a8ea701c78fedb24333cc73ddbe4891acd00d5af9edc0bd6f9296d618f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
