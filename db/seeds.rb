20.times do |i|
  User.create!(email: "test#{i + 1}@example.com", password: "password", password_confirmation: "password", nickname: "ニックネーム#{i + 1}", profile: "宜しくお願いします！")
end

users = User.order(:created_at)
6.times do |i|
  text = Faker::Lorem.sentence
  users.each{ |user| user.posts.create!(name:"テスト山#{i + 1}", text: text, image: open("#{Rails.root}/app/assets/images/利尻山.png"), elevation: "87#{i + 1}", walking_distance: "1#{i + 1}", difficulty: rand(3)) }
end
