require("pry")
# binding.pry

class Song
  attr_reader :song

  def initialize(song)
    @song = song
  end
end
