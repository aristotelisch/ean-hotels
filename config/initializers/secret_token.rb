# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# EanHotels::Application.config.secret_key_base = '0d83bb708994de674e78843357ed05f88ca85e36b5daeae4e71888934617d15037f3b0106b1d159c4cc355d0413d7358e8dc7ccf84f7f33add573013fa44fab7'
EanHotels::Application.config.secret_key_base = ENV['SECRET_TOKEN']
