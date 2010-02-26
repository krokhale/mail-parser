# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_parser_session',
  :secret      => 'b9f32da00d408b7f792091bd8d6578e1b9022bf27127f1294f7149a844b7ffe33581aac96b0cfdc8742f88fa64311e050edc7eca3f4f838a186e00041f100bbf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
