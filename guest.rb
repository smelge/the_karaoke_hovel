# name
# money
# favourite song

require("pry")
# binding.pry

class Guest
  attr_reader :name,:song
  attr_accessor :money,:bar_tab

  def initialize(name,money,song)
    @name = name
    @money = money
    @song = song
    @bar_tab = 0
  end


end
