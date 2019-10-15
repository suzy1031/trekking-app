FactoryBot.define do
  factory :post do
    name    { "テスト山" }
    text    { "楽しい山登り" }
    elevation { 800 }
    walking_distance { 10 }
    difficulty { 2 }
  end
end