require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation" do
      user = User.new(nickname: "aaabbbccc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", profile: "", image: "")
      user.valid?
    end
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "is invalid with wrong email format(without '@')" do
      user = build(:user, email: "tester1.gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with wrong email format(without characters before @)" do
      user = build(:user, email: "@gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with wrong email format(without characters after @)" do
      user = build(:user, email: "tester1@")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with wrong email format(last character is number)" do
      user = build(:user, email: "tester1@gmail.com1")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "is invalid with different password" do
      user = build(:user, password: Faker::Lorem.characters(8), password_confirmation: Faker::Lorem.characters(9))
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
  end
end