FactoryGirl.define do
  factory :song do
    title "Song title"
    artist "Song artist"
    text "Song text"
    single false
    release_date { Faker::Date.between(5.years.ago, Date.today) }
    rating { Faker::Number.between(0, 10) }

    association :user
  end
end
