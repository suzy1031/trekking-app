10.times do |i|
  i += 1
  user = User.create!(
    email: "user#{i}@example.com",
    password: 'password',
    password_confirmation: "password",
    nickname: "ニックネーム#{i}",
    profile: "宜しくお願いします！"
  )

  3.times do |j|
    users = User.order(:created_at)
    j += 1
    users.each{user.posts.create!(name:"テスト山#{j}",
      text: "楽しい山登り！",
      image: open("#{Rails.root}/app/assets/images/利尻山.png"),
      elevation: "87#{j}",
      walking_distance: "1#{j}",
      difficulty: rand(3)
    )}

    users.each{user.likes.create!(post_id: i, user_id: j)}
  end
end

users = User.all
user  = users.first
following = users[2..9]
followers = users[3..8]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
