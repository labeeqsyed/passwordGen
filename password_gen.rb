module Password_Generator

  # utility functions

  def valid_pin?(pin)
    /^\d{1,}$/ === pin
  end

  def getPass
    pass_v = false
    until pass_v==true do
      puts "Please enter password length: ( Length should be a number and size of at least 1)"
      pass = gets
      if valid_pin? pass
        pass_v = true
      else
        puts "Wrong... Try Again!"
      end
    end
    return pass
  end


  def valid_option?(pin)
    pin.between?(1,5)
  end

  def getType
    pass_v = false
    until pass_v==true do
      puts "\n\nEnter type of password:"
      puts "1 => Numeric\n2 => Alphabetic\n3 => Alphanumeric\n4 => Alphanumeric with Special characters\n5 => Special characters only"
      pass = gets.to_i
      if valid_option? pass
        pass_v = true
      else
        puts "Wrong... Try Again!"
      end
    end
    return pass
  end






  def alphabet(n)
    char_set = (('a'..'z').to_a + ('A'..'Z').to_a).shuffle
    set = []
    n.times {set << char_set[rand(0...char_set.length)]}
    return set
  end
  def numeric(n)
    set = []
    n.times {set << rand(0..9)}
    return set
  end
  def alphanumeric(n)
    char_set = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + (0..9).to_a).shuffle

    set = []
    n.times {set << char_set[rand(0...char_set.length)]}
    return set
  end
  def alphanumeric_special(n)
    special = []
    (58..64).to_a.each {|n| special<< n.chr}
    (33..47).to_a.each {|n| special<< n.chr}
    char_set = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + special).shuffle
    set = []
    n.times {set << char_set[rand(0...char_set.length)]}
    return set
  end

  def special(n)
    special = []
    (58..64).to_a.each {|n| special<< n.chr}
    (33..47).to_a.each {|n| special<< n.chr}
    char_set = special.shuffle
    set = []
    n.times {set << char_set[rand(0...char_set.length)]}
    return set
  end


  def generate_password
    puts "============================="
    puts "Welcome to Password Generator"
    puts "=============================\n\n\n"

    len = getPass.to_i



    type = getType.to_i



    case type
    when 1
      puts "\n\nPassword: " + numeric(len).join('')

    when 2
      puts "\n\nPassword: " + alphabet(len).join('')

    when 3
      puts "\n\nPassword: " + alphanumeric(len).join('')

    when 4
      puts "\n\nPassword: " + alphanumeric_special(len).join('')

    when 5
      puts "\n\nPassword: " + alphanumeric_special(len).join('')

    else
      puts "Wrong input"

    end





  end

end
include Password_Generator

generate_password
