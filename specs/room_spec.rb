require("minitest/autorun")
require('minitest/rg')
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class  Test_rooms < MiniTest::Test
  def setup()
    @guest1 = Guest.new("Peter Grablady",45,"Take on me")
    @guest2 = Guest.new("Shaun Firewarden",35,"Poker Face")
    @guest3 = Guest.new("Gabriel Scooter",23,"Despacito")
    @guest4 = Guest.new("Elaine Pears",86,"Space Dementia")
    @guest5 = Guest.new("Judith Basketloaf",83,"Bob the Builder")
    @guest6 = Guest.new("Dwayne 'The Rock' Johnson",2983332,"Californication")
    @guest7 = Guest.new("Mary Punctuation",46,"Elevation")
    @guest8 = Guest.new("Sharleen Shutters",473,"Meatplow")
    @guest9 = Guest.new("Fred Burger",12,"Monkey Wrench")
    @guest10 = Guest.new("Stacey Groad",39,"Annie ate her gun")
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
    @room1 = Room.new("Green Room",4)
    @room2 = Room.new("Red Room",7)
    @room3 = Room.new("Puce Room",5)
    @room4 = Room.new("Really Big room",900)
  end

  def test_room_name
    assert_equal("Red Room",@room2.name)
  end

  def test_room_capacity
    assert_equal(900,@room4.capacity)
  end

  def test_add_song_to_playlist
    assert_equal(["Song 2"],@room2.add_song(@song2.song))
  end

  def test_play_playlist
    @room3.add_song(@song1.song)
    @room3.add_song(@song5.song)
    @room3.add_song(@song4.song)
    @room3.add_song(@song2.song)

    assert_equal("Granny has a new moustache Hoodoo Operator Take on me Song 2 ",@room3.play)
  end

  def test_guest_in_to_room2
    assert_equal(["Peter Grablady"],@room2.add_guest(@guest1))
  end

  def test_guest_out_of_room2
    @room3.add_guest(@guest2)
    @room3.add_guest(@guest4)
    @room3.add_guest(@guest1)
    @room3.add_guest(@guest5)
    assert_equal("Shaun Firewarden Elaine Pears Peter Grablady Judith Basketloaf ",@room3.guest_list)
    @room3.remove_guest(@guest1)
    assert_equal("Shaun Firewarden Elaine Pears Judith Basketloaf ",@room3.guest_list)
  end

  def test_room_under_capacity__false
    @room3.add_guest(@guest2)
    @room3.add_guest(@guest4)
    @room3.add_guest(@guest1)
    @room3.add_guest(@guest5)
    @room3.add_guest(@guest7)
    @room3.add_guest(@guest9)
    @room3.add_guest(@guest3)

    assert_equal(false,@room3.check_capacity)
  end

  def test_room_under_capacity__false
    @room3.add_guest(@guest2)
    @room3.add_guest(@guest4)
    @room3.add_guest(@guest1)

    assert_equal(true,@room3.check_capacity)
  end

  def test_too_many_added
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    @room1.add_guest(@guest7)
    @room1.add_guest(@guest4)
    assert_equal("Room has no space",@room1.add_guest(@guest5))
  end

  def test_entry_fee
    @room2.add_guest(@guest1)
    assert_equal(40,@guest1.money)
  end

  def test_play_music
    # Put songs in playlist
    @room3.add_song(@song1.song)
    @room3.add_song(@song3.song)
    @room3.add_song(@song5.song)
    @room3.add_song(@song4.song)
    @room3.add_song(@song9.song)
    @room3.add_song(@song6.song)
    @room3.add_song(@song7.song)
    # put people in room
    @room3.add_guest(@guest1)
    @room3.add_guest(@guest2)
    @room3.add_guest(@guest3)
    @room3.add_guest(@guest7)
    @room3.add_guest(@guest4)

    assert_equal("Someone really liked: Take on me ",@room3.play_songs())
  end

  def test_buy_drink
    @room3.add_guest(@guest3)
    @room3.add_guest(@guest7)
    @room3.add_guest(@guest4)

    # Buy drinks
    @room3.buy_drink(@guest3,12)
    @room3.buy_drink(@guest3,14)
    @room3.buy_drink(@guest3,10)

    assert_equal(36,@room3.current_tab(@guest3))
  end

  def test_pay_tab
    @room3.add_guest(@guest3)
    @room3.add_guest(@guest7)
    @room3.add_guest(@guest4)

    # Buy drinks
    @room3.buy_drink(@guest3,5)
    @room3.buy_drink(@guest3,8)
    @room3.buy_drink(@guest3,8)
    @room3.buy_drink(@guest1,9)
    @room3.buy_drink(@guest1,16)
    @room3.buy_drink(@guest1,4)

    assert_equal("Tab has been paid, wallet is now: £16",@room3.pay_tab(@guest1))
    assert_equal("Tab is £21. The customer only has £18. Not enough money to pay tab. Customer must now be beaten.",@room3.pay_tab(@guest3))
  end
end
