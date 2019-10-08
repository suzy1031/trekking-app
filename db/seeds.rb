5.times do |i|
  User.create!(email: "test#{i + 1}@example.com", password: "password", password_confirmation: "password", nickname: "ニックネーム#{i + 1}", profile: "宜しくお願いします！")
end