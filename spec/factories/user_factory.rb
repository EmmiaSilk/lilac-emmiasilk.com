FactoryBot.define do
  # Traits: Role - ['user', 'admin', or 'poster']
  factory :user, class: 'User', aliases: [:author] do
    # I spent twenty minutes trying to get this tool to let me include
    # a role marker in the username but is too good for that.
    sequence(:username) { |n| "user#{n}" }
    # User info
    role "user"
    # The tool for generating a unique sequential string does not
    # generate a unique sequential string. Because of this, the email
    # always has already been taken.
    sequence(:email) { |n| "users#{n}@example.com"}
    # FactoryBot gets mad at me when I try to leave these strings
    # outside blocks.
    password {"#{username}pass"}
    # I am not allowed to confirm my password.
  end

end
