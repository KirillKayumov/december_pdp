class << self
  def lyrics(title)
    File.read(File.expand_path("../lyrics/#{title}", __FILE__))
  end

  def image(title)
    Rack::Test::UploadedFile.new(File.expand_path("../images/#{title}", __FILE__), "image/jpeg")
  end
end

user = User.last || FactoryGirl.create(:user)

FactoryGirl.create :song,
  title: "A Million And One Question",
  artist: "Jay-Z",
  lyrics: lyrics("a_million_and_one_question.txt"),
  user: user,
  image: image("a_million_and_one_question.jpg")

FactoryGirl.create :song,
  title: "We Dem Boyz",
  artist: "Wiz Khalifa",
  lyrics: lyrics("we_dem_boyz.txt"),
  user: user,
  image: image("on_my_level.jpg"),
  single: true

FactoryGirl.create :song,
  title: "Hell Of A Life",
  artist: "Kanye West",
  lyrics: lyrics("hell_of_a_life.txt"),
  user: user,
  image: image("hell_of_a_life.jpg")

FactoryGirl.create :song,
  title: "On My Level",
  artist: "Wiz Khalifa & Too $hort",
  lyrics: lyrics("on_my_level.txt"),
  user: user,
  image: image("on_my_level.jpg")

FactoryGirl.create :song,
  title: "Hate It Or Love It",
  artist: "The Game & 50 Cent",
  lyrics: lyrics("hate_it_or_love_it.txt"),
  user: user,
  image: image("hate_it_or_love_it.jpg"),
  single: true

FactoryGirl.create :song,
  title: "New World",
  artist: "Nas",
  lyrics: lyrics("new_world.txt"),
  user: user,
  image: image("new_world.jpg")

FactoryGirl.create :song,
  title: "The Town",
  artist: "The Weeknd",
  lyrics: lyrics("the_town.txt"),
  user: user,
  image: image("the_town.jpg")

FactoryGirl.create :song,
  title: "As You Are",
  artist: "The Weeknd",
  lyrics: lyrics("as_you_are.txt"),
  user: user,
  image: image("as_you_are.jpg")

FactoryGirl.create :song,
  title: "The Motion",
  artist: "Drake",
  lyrics: lyrics("the_motion.txt"),
  user: user,
  image: image("the_motion.jpg"),
  single: true

FactoryGirl.create :song,
  title: "Good Guys Get Left Behind",
  artist: "Hopsin",
  lyrics: lyrics("good_guys_get_left_behind.txt"),
  user: user,
  image: image("good_guys_get_left_behind.jpg")
