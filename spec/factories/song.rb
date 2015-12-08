FactoryGirl.define do
  factory :song do
    title "Song title"
    artist "Song artist"
    lyrics "Song lyrics"
    single false
    release_date { Faker::Date.between(1.year.ago, Date.today) }
    rating { Faker::Number.between(0, 10) }

    association :user
  end
end
