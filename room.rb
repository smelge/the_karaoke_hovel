# room name
# capacity
# playlist

require("pry")
# binding.pry

class Room
  attr_reader :name,:capacity,:cost
  attr_accessor :playlist,:guestlist

  def initialize(name,capacity)
    @name = name
    @capacity = capacity
    @guestlist = []
    @playlist = []
    @fav_songs = []
    @cost = 5
  end

  def add_song(song)
    @playlist << song
  end

  def add_guest(guest)
    if check_capacity == true
      guest.money -= @cost

      @fav_songs << guest.song
      @guestlist << guest.name
    else
      return "Room has no space"
    end
  end

  def guest_list
    return @guestlist.map{|guest| "#{guest} "}.join
  end

  def remove_guest(guest)
    # binding.pry
    @guestlist.delete(guest.name)
  end

  def play
    # binding.pry
    return @playlist.map{|song| "#{song} "}.join
  end

  def check_capacity
     # binding.pry
    if @guestlist.count > @capacity
      return false
    end
    return true
  end

  def play_songs
    # Loop through songs in playlist
    responses = ""
    @playlist.each do |current_song|
      p current_song
      if @fav_songs.include?(current_song)

        if current_song == "Despacito"
          responses += "Someone was shot for liking: #{current_song} "
        end

        responses << "Someone really liked: #{current_song} "
      end
    end

    return responses
  end

  def buy_drink(guest,cost)
    guest.bar_tab += cost
  end

  def current_tab(guest)
    return guest.bar_tab
  end

  def pay_tab(guest)
    # binding.pry
    if guest.money >= guest.bar_tab
      guest.money -= guest.bar_tab
      guest.bar_tab = 0
      return "Tab has been paid, wallet is now: £#{guest.money}"
    else
      return "Tab is £#{guest.bar_tab}. The customer only has £#{guest.money}. Not enough money to pay tab. Customer must now be beaten."
    end
  end
end
