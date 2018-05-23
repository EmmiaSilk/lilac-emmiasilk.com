require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
    described_class.new(
      author: create(:user),
      title: "cake",
      body: "This is an article"
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:author_id) }
  end

  describe "Associations" do
    it { should belong_to(:author) }
    it { should have_many(:comments) }
  end

end
