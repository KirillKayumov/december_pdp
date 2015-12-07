class << self
  def lyrics(title)
    File.read(File.expand_path("../lyrics/#{title}", __FILE__))
  end
end

user = User.last || FactoryGirl.create(:user)

FactoryGirl.create :song,
  title: "A Million And One Question",
  artist: "Jay-Z",
  text: lyrics("a_million_and_one_question.txt"),
  user: user

FactoryGirl.create :song,
  title: "We Dem Boyz",
  artist: "Wiz Khalifa",
  text: lyrics("we_dem_boyz.txt"),
  user: user

FactoryGirl.create :song,
  title: "Hell Of A Night",
  artist: "Kanye West",
  text: lyrics("hell_of_a_night.txt"),
  user: user

FactoryGirl.create :song,
  title: "On My Level",
  artist: "Wiz Khalifa & Too $hort",
  text: lyrics("on_my_level.txt"),
  user: user

FactoryGirl.create :song,
  title: "Hate It Or Love It",
  artist: "The Game & 50 Cent",
  text: lyrics("hate_it_or_love_it.txt"),
  user: user

FactoryGirl.create :song,
  title: "New World",
  artist: "Nas",
  text: lyrics("new_world.txt"),
  user: user

FactoryGirl.create :song,
  title: "The Town",
  artist: "The Weeknd",
  text: lyrics("the_town.txt"),
  user: user

FactoryGirl.create :song,
  title: "As You Are",
  artist: "The Weeknd",
  text: lyrics("as_you_are.txt"),
  user: user

FactoryGirl.create :song,
  title: "The Motion",
  artist: "Drake",
  text: lyrics("the_motion.txt"),
  user: user

FactoryGirl.create :song,
  title: "Good Guys Get Left Behind",
  artist: "Hopsin",
  text: lyrics("good_guys_get_left_behind.txt"),
  user: user
