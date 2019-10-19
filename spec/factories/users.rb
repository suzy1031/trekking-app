FactoryBot.define do

  factory :user, class: User do
    nickname              {"ニックネーム"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    profile               {"宜しく！"}


    factory :other_user do
      nickname { "ニックネーム" }
      email { "sss@gmail.com" }
      password              {"00000000"}
      password_confirmation {"00000000"}
      profile               {"宜しく！"}
    end
  end
end