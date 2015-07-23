require "rails_helper"

RSpec.describe User, :type => :model do
  context "check validation User" do
    it "password length less than 8 characters invalid" do
      user = User.new email: "Ronaldo", password: "1234567"
      result = user.save

      expect(result).to be false
    end
  end
end

describe User do
  context "check relationships User" do
    it {should have_many :reviews}
    it {should have_many :readings}
    it {should have_many :comments}
    it {should have_many :favorites}
    it {should have_many :requests}
    it {should have_many :activities}
    it {should have_many :favorited_books}
    it {should have_many :reading_books}
    it {should have_many :active_relationships}
    it {should have_many :passive_relationships}
    it {should have_many :following}
    it {should have_many :followers}
  end
end

describe User do
  it "check set_default_role" do
    user = User.new email: "Ronaldo@123.com", password: "12345678"

    expect(user.set_default_role).to eq "user"
  end
end

describe User do
  it "check follow" do
    user1 = User.create! email: "Ronaldo@123.com", password: "12345678"
    user2 = User.create! email: "Ronaldinho@123.com", password: "12345678"
    user1.follow user2

    expect(Relationship.last.follower_id).to eq user1.id
    expect(Relationship.last.followed_id).to eq user2.id
  end
end

describe User do
  it "check following?" do
    user1 = User.create! email: "Ronaldo@123.com", password: "12345678"
    user2 = User.create! email: "Ronaldinho@123.com", password: "12345678"
    user1.follow user2
    
    expect(user1.following? user2).to be true
  end
end

describe User do
  it "check unfollow" do
    user1 = User.create! email: "Ronaldo@123.com", password: "12345678"
    user2 = User.create! email: "Ronaldinho@123.com", password: "12345678"
    user1.follow user2
    user1.unfollow user2

    expect(user1.following? user2).to be false
  end
end
