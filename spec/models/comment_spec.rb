require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject {
    described_class.new(
      body: "This is a comment",
      author: create(:user),
      article: create(:article)
    )
  }
  
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:article_id) }
    it { should validate_presence_of(:author_id) }
  end

  describe "Associations" do
    it { should belong_to(:author) }
    it { should belong_to(:article) }
  end
end
