FactoryBot.define do
  # Traits: Author(poster)
  factory :article do
    title "Example"
    text "This article is an example."
    author {create(:user)}
  end
end
