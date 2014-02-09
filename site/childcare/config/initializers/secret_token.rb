# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Childcare::Application.config.secret_key_base = secure_token

# old (static) secret key)
# Childcare::Application.config.secret_key_base = '1b94ec030c07bb41e44ceffb3c5fcfc2c532d258e5c47006a0cf50ec7fccd28d5c63464742ccb84872d2a605a78e8cdca7de52fd91190c2c8052aa427634f393'
