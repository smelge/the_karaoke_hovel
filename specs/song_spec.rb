require("minitest/autorun")
require('minitest/rg')
require_relative("../song.rb")

class  Test_songs < MiniTest::Test
  def setup()
    @song1 = Song.new("Granny has a new moustache")
    @song2 = Song.new("Song 2")
    @song3 = Song.new("Beelzeboss")
    @song4 = Song.new("Take on me")
    @song5 = Song.new("Hoodoo Operator")
    @song6 = Song.new("Meatplow")
    @song7 = Song.new("Californication")
    @song8 = Song.new("Monkey Wrench")
    @song9 = Song.new("Five Fingers of Fudge")
    @song10 = Song.new("Stockholm Syndrome")
  end

  def test_play_song
    assert_equal("Take on me",@song4.song)
  end
end
