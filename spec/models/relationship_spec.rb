require 'rails_helper'

RSpec.describe Relationship, type: :model do

  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }
  let(:active) { user.active_relationships.build(followed_id: other_user.id) }
  subject { active }

  it { should be_valid }

  describe "follower/followed methods" do
  it { should respond_to(:follower) }
  it { should respond_to(:followed) }

  end

  it "follower method return following_user" do
    expect(active.follower).to eq user
  end

  it "followed method return followed-user" do
    expect(active.followed).to eq other_user
  end

  describe "validations" do

    describe "presence" do
      it { is_expected.to validate_presence_of :followed_id }
      it { is_expected.to validate_presence_of :follower_id }
    end
  end
end