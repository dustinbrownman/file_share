# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
FileShare::Application.config.secret_key_base = 'e8a74295c7d1df84b5f87dba6a587b77a8f2cdfbe721cab237eed72c33a7847b949e828471fde45e4cfd02b0e6ab76d154ae934b2d4c5dc4249362c4b630f6da'
