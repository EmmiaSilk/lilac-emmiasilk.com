FactoryBot.define do
  # Traits: Author
  factory :comment do
    body "This is a comment."
    article {create(:article)}
    author {create(:user)}
  end
end
