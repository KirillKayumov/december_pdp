class << self
  def lyrics(title)
    File.read(File.expand_path("../../development/lyrics/#{title}", __FILE__))
  end

  def image(title)
    Rack::Test::UploadedFile.new(File.expand_path("../../development/images/#{title}", __FILE__), "image/jpeg")
  end
end

user = User.create!(
  email: "user@example.com",
  full_name: "Name Surname",
  password: "356194",
  password_confirmation: "356194",
  confirmed_at: 1.hour.ago
)

Song.create!(
  title: "A Million And One Question",
  artist: "Jay-Z",
  lyrics: lyrics("a_million_and_one_question.txt"),
  user: user,
  image: image("a_million_and_one_question.jpg"),
  release_date: 1.day.ago.to_date
)

Song.create!(
  title: "We Dem Boyz",
  artist: "Wiz Khalifa",
  lyrics: lyrics("we_dem_boyz.txt"),
  user: user,
  image: image("on_my_level.jpg"),
  single: true,
  rating: 1
)

Song.create!(
  title: "Hell Of A Life",
  artist: "Kanye West",
  lyrics: lyrics("hell_of_a_life.txt"),
  user: user,
  image: image("hell_of_a_life.jpg"),
  release_date: 1.week.ago.to_date
)

Song.create!(
  title: "On My Level",
  artist: "Wiz Khalifa & Too $hort",
  lyrics: lyrics("on_my_level.txt"),
  user: user,
  image: image("on_my_level.jpg"),
  rating: 2
)

Song.create!(
  title: "Hate It Or Love It",
  artist: "The Game & 50 Cent",
  lyrics: lyrics("hate_it_or_love_it.txt"),
  user: user,
  image: image("hate_it_or_love_it.jpg"),
  single: true,
  release_date: 1.month.ago.to_date
)

Song.create!(
  title: "New World",
  artist: "Nas",
  lyrics: lyrics("new_world.txt"),
  user: user,
  image: image("new_world.jpg"),
  rating: 3
)

Song.create!(
  title: "The Town",
  artist: "The Weeknd",
  lyrics: lyrics("the_town.txt"),
  user: user,
  image: image("the_town.jpg"),
  release_date: 1.year.ago.to_date
)

Song.create!(
  title: "As You Are",
  artist: "The Weeknd",
  lyrics: lyrics("as_you_are.txt"),
  user: user,
  image: image("as_you_are.jpg"),
  rating: 4
)

Song.create!(
  title: "The Motion",
  artist: "Drake",
  lyrics: lyrics("the_motion.txt"),
  user: user,
  image: image("the_motion.jpg"),
  single: true
)

Song.create!(
  title: "Good Guys Get Left Behind",
  artist: "Hopsin",
  lyrics: lyrics("good_guys_get_left_behind.txt"),
  user: user,
  image: image("good_guys_get_left_behind.jpg"),
  rating: 5
)
