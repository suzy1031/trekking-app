require 'rails_helper'

RSpec.feature "login & logout" do
  scenario "user login" do
    @user = User.create(
      email:                 "test@example.com",
      password:              "000000",
      password_confirmation: "000000",
      nickname:              "ニックネーム",
      profile:               "宜しく！"
    )

      visit new_user_session_path
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード",    with: @user.password

      click_button "ログイン"
      expect(page).to have_content "ログインしました"
  end
end