10.times do |i|
  i += 1
  user = User.create!(
    email:                  "user#{i}@example.com",
    password:               "password",
    password_confirmation:  "password",
    nickname:               "ニックネーム#{i}",
    profile:                "宜しくお願いします！",
    image:                  open("#{Rails.root}/db/fixtures/ユーザー.jpeg")
  )
  3.times do |j|
    users = User.order(:created_at)
    j += 1
    users.each{user.posts.create!(
      name:                 "テスト山#{j}",
      text:                 "楽しい山登り！",
      image:                open("#{Rails.root}/db/fixtures/利尻山.jpeg"),
      elevation:            "87#{j}",
      walking_distance:     "1#{j}",
      difficulty:           rand(3),
      prefecture_id:        rand(1..46)
    )}

    users.each{user.likes.create!(post_id: i, user_id: j)}
  end
end

10.times do |m|
  m += 1
  Meal.create!(
    user_id:                "#{m}",
    post_id:                "#{m}",
    name:                   "テスト飯#{m}",
    image:                  open("#{Rails.root}/db/fixtures/カレー.jpeg"),
    cooking_time:           "1#{m}",
    food_stuff:             "じゃがいも。人参。玉ねぎ",
    cooking_method:          "お湯を沸かして野菜を煮込む。"
  )
end

users = User.all
user  = users.first
following = users[2..9]
followers = users[3..8]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
