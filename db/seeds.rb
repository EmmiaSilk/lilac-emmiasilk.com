# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'yaml'

# Temporary classes created for seeding
class SeedUser
  attr_accessor :username, :email, :password, :role
end

# Load default users from file
default_users = 'db\seed_data\default_users.yml'
seedUsers = YAML::load(File.open(default_users))

# Create each seeded user
seedUsers.each do |seedUser|
  if !( User.find_by(username: seedUser.username) )
    user = User.new()
    user.username = seedUser.username
    user.email = seedUser.email
    user.password = seedUser.password
    user.password_confirmation = seedUser.password
    user.role = seedUser.role ? seedUser.role : "user"
    user.save!
  end
end
