require_relative("./guest.rb")
require_relative("./room.rb")
require_relative("./song.rb")

# Set up rooms
@room1 = Room.new("Green Room",4)
@room2 = Room.new("Red Room",7)
@room3 = Room.new("Puce Room",5)
@room4 = Room.new("Really Big room",900)

# Set up guests
new_guest = []

quit = false
until quit == true

  # menu
  p "==================================="
  p "| 1                    View Rooms |"
  p "| 2          Add C̛̄͆͑ͧͭͨͧ̈̎̂ͬ͛͊҉̛͍͕̜̹̜̘̤̼u̧͈̫̲͕̤̬̹͉̪̘͕̹̺͕̻͔ͤ̽͆ͭͬ̉ͨ͐ͦ͋̇̋̐ͯ͝ͅś́͒̃̽ͮ̈́̍̏ͦ͌̑̈́͊̚̚͏̵͓̪̟̠̟̭̱͈͉̳̺̙̙̕t̽̂̋͒͐̍͠҉̡̤̣̟̖̟̺͎͉̞̀o̲̞͈͈̖͚̰̯̘̘̣̻̲͓̗̱ͥͮ̉̂̓̒̇̃̃̅͌ͪͫ͂̆ͭ̚͜͟m̢͇̮͎̤̫̺͇̞̅ͭ̑ͣȩ͛ͯͪ̍̿ͭ̚͡҉͓̦̦͇̭̻͉̭̳̼͟r̷̵̞̙̖͇̠̫͎͎͚̘͎̮͙͑̋̈́̓͑͂ͯ̾͘ to Room |"
  p "| 3     Remove C̛ư͞s̸͘͜͠t̵͞ó̸̶̀m̨͝͡e͏́̀̕r͜͞ from Room |"
  p "| 4               Create Playlist |"
  p "==================================="
  p "| 5                Add a C̨̠̺̘̳̮͇̘̩̲͢u̷̠͎̻̼̣͇̺̪̹̳̰͇͙͖̪̞͈̠͜͟͡͝s̵̨̢̹̖͔̥̲̯̟̩̻̲̦̦̼̪͚̤̭t҉̶̭̜̠̭ͅo̴͍̳̺̫̫̗̞̝̪̺͕͔̬͓̕͜͢͝ͅm̨̙̜̺͚̳͕̠͟͠ę̶̠̦͕͕͍͇̟͈̮̗̜̠̜̟̜̠͉͜͝r҉̶̯͚̦̪̞̦͙̘̬̣̣̯̙̞̫̙̲͟ |"
  p "| 6             Remove a C͗͏̸̨u͂̍̔͛̈́ͥ͡ś͞tͯ̆̉͞͡őͦ͢m̷͌̃ê̓͊̌͘r̶͂͛͐̾ͥ̚͏́ |"
  p "| 7       View & Pay C̶̀҉͝ú̶͝͝s̴̢̀҉̵t͡͞҉̧o͜m̷̛e͜͜r̴͢ Tab |"
  p "==================================="
  p "| 8                          Quit |"
  p "==================================="

  menu_input = gets.chomp.to_i

  case menu_input
    when 1
      p "==================================="
      p "View Rooms"
      p "==================================="
      p "#{@room1.name}: #{@room1.guestlist.count}/#{@room1.capacity}"
      p "#{@room2.name}: #{@room2.guestlist.count}/#{@room2.capacity}"
      p "#{@room3.name}: #{@room3.guestlist.count}/#{@room3.capacity}"
      p "#{@room4.name}: #{@room4.guestlist.count}/#{@room4.capacity}"
    when 2
      p "==================================="
      p "Add customer to room"
      p "==================================="
      guest_loop = 1
      p "Guests in lobby"
      new_guest.each do |guest|
        p "#{guest_loop} - #{guest}"
        guest_loop += 1
      end

      p "Rooms Available"
      p "a - #{@room1.name}: #{@room1.guestlist.count}/#{@room1.capacity}"
      p "b - #{@room2.name}: #{@room2.guestlist.count}/#{@room2.capacity}"
      p "c - #{@room3.name}: #{@room3.guestlist.count}/#{@room3.capacity}"
      p "d - #{@room4.name}: #{@room4.guestlist.count}/#{@room4.capacity}"
      p "==================================="
      p "Input Customer Number: "
      customer_no = gets.chomp.to_i
      p "Input Room Letter: "
      room_no = gets.chomp.downcase

      guest_name = new_guest[customer_no - 1]
      p "GUEST: #{guest_name}"
      case room_no
        when "a"
          @room1.add_guest(guest_name)
          new_guest.delete_at(customer_no - 1)
        when "b"
          @room2.add_guest(guest_name)
        when "c"
          @room3.add_guest(guest_name)
        when "d"
          @room4.add_guest(guest_name)
        else
          p "I̷͖͎͉̯̝̖̮̍͋ͩ̕̕n̴̶̝͕̰̮̝̭͕̄̉̉ͬ͆ͣ̔̿ͤ̊̀ͅc̵̵̛̘̣̥͙̭͖͙͙̼̱̬̲̞̻̄ͥ̈́͐͂ͯ̍̍ͥͮ͆ͬ̐̒ͭ̐̇ͮ͘o̵̶̱̠̼̟͇̪͕̼̺͉̟̖͙͈͕͕̼͒̿̇͑ͣ̈ͭ̑͊̓̽̈́ͪͯͩͦ̿̚ͅr̷̷̨̰̠̲̭̼̞̬̬͈̞ͨ̓ͩ̆̆̍̎͛ͯ̀ͅr̛̟͈͔̹͙̼̭̜̹͉̯͌ͪ͋̆ͤ̅ͤ̎ͪ̽ͣ́̚̚̚͝e̷͍̱̜̼̻̤͈̥̮̱̱̤̜̤͇̙̰͂̍͐ͣ̈ͣ͘ͅç̵̞̘̪̞͔̜̻̰̥̘̜̳̋ͩͬͣ̅̄̓̂ͧ̐ͬ͐̓̈́t̑͒͒ͪͤ͂ͦͦͮ͂ͭ̂͠͏̪͎̦͔͎̺̣̯̲͙̼͖ ̧̛͋̾͂̽ͮͥ̓̊ͣ̉͊͑͂̊̈́ͫ̕͡͏̥̮͍̪͉̹̦̳̪͍͙̯̠̭̖̝͙̤ͅR̵̷̬̳̮̺̳̯͉̼̻͕̯̖̝͎͎̞̝̅̑̀ͫ̂̍̾̉ǫ͔̼͍̜̯̦͎̱̗͋͑ͫ̋̑̅̈́̃͊ͧ̑͆͋̀͛͑̓́͘͜͡o̴̵̧͎̟̗̖̲̩̟̥̯̱̻͋̄̾͌̀m̴̴̂ͫ̏ͣ̊͑̓̓͊̈́ͣ̄͏̟̗̘̣̺̯͔̪͉̫̭̲̹̙̥͔͚̯ ̯̲̹͖͓̞̱̼͎̬͔̪̪̭͔͍͉͌̎̎͋͑̐̄ͨ̄ͩ̐̕͘͟ͅS̢ͩ͆̃̽̇̅҉̴҉̳̣͎̜̼̠̟̺̭̮̥ͅë̴̵̢͓͚̘͓͕̠̼͈̞̙̟̮̘̘͉ͮͫ͑̄̏̂ͧ̈́̈́̏ͭ̃̿͘l̶̡̝̠̖̥̦̯̻̜̙͎̀̋̀ͤ͑͛͐ͩ̈̓̋ͯ̎͛ͨ̒ͨ͘͘͡ĕ̙̬̩̳̹̣̰̱̾̌̉ͫ̀ͤ̕c̨͚̝͖̟̦̞̲̟̦͖͇͇̖̳̝̼̄̈́̋ͪͯ̅͂ͬ͂ͨ̚͢͝t̡͉̦̪̖̖͉̳̻̜̱̝̰͔͈̭̜͚͈͙̀ͥͩ̂̿̽̏ͤ̈ͫ̑̔ͫ̎́i̷̗̦̣̝͙̓̃ͯ̆̉͑̂͒ͪ́̀͘͜o͆ͪͦ̄҉̸̨̛̫͇̯͔̮͓͡n̶̶͕̯͎͕͙̭̮̮̫͊̂ͥ́̒ͯ͗̋̀ͧ"
        end
    when 3
      p "==================================="
      p "Remove customer from room"
      p "==================================="
    when 4
      p "==================================="
      p "Create playlist"
      p "==================================="
    when 5
      p "==================================="
      p "Add a customer"
      p "==================================="
      p "Name: "
      name = gets.chomp
      p "Cash Available: "
      money = gets.chomp
      p "Favourite Song: "
      song = gets.chomp
      Guest.new(name,money,song)
      new_guest << name
      p "#{name} added!"
      p "==================================="
    when 6
      p "==================================="
      p "Remove Customer"
      p "==================================="
    when 7
      p "==================================="
      p "View and pay tab"
      p "==================================="
    else
      quit = true
  end
end
puts "Quitting..."
