require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "user creates a new post" do
    @user = User.create(
      email:                 "test@example.com",
      password:              "000000",
      password_confirmation: "000000",
      nickname:              "ニックネーム",
      profile:               "宜しく！"
    )

    visit root_path

    visit new_user_session_path

    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード",     with: @user.password
    click_button "ログイン"

    expect {
      visit new_post_path

      fill_in "yama-new-name",        with: "テスト山"
      fill_in "textarea",             with: "始めての登山！"
      attach_file "yama-new-picture", "#{Rails.root}/db/fixtures/利尻山.jpeg"
      fill_in "meshi-new-name",       with: "カレー"
      fill_in "cooking_time",         with: "20"

      click_button "投稿する"

      expect(page).to have_content "投稿が完了しました！"
    }.to change(@user.posts, :count).by(1)
  end
end
