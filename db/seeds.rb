# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: 'test_user1@gmail.com', nickname: 'user1', password: '111111', password_confirmation: '111111')
User.create(email: 'test_user2@gmail.com', nickname: 'user2', password: '111111', password_confirmation: '111111')
Chat.create(name: "live chat")