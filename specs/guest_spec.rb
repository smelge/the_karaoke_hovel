require("minitest/autorun")
require('minitest/rg')
require_relative("../guest.rb")

class  Test_guests < MiniTest::Test
  def setup()
    @guest1 = Guest.new("Peter Grablady",45,"Take on Me")
    @guest2 = Guest.new("Shaun Firewarden",35,"Poker Face")
    @guest3 = Guest.new("Gabriel Scooter",23,"Despacito")
    @guest4 = Guest.new("Elaine Pears",86,"Space Dementia")
    @guest5 = Guest.new("Judith Basketloaf",83,"Bob the Builder")
    @guest6 = Guest.new("Dwayne 'The Rock' Johnson",2983332,"Californication")
    @guest7 = Guest.new("Mary Punctuation",46,"Elevation")
    @guest8 = Guest.new("Sharleen Shutters",473,"Meatplow")
    @guest9 = Guest.new("Fred Burger",12,"Monkey Wrench")
    @guest10 = Guest.new("Stacey Groad",39,"Annie ate her gun")
  end

  def test_guest_name
    assert_equal("Judith Basketloaf",@guest5.name)
  end

  def test_guest_money
    assert_equal(473,@guest8.money)
  end

  def test_guest_song
    assert_equal("Monkey Wrench",@guest9.song)
  end
end
