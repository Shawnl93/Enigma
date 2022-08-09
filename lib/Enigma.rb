class Enigma

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def encrypt(message, key, date)
    require "pry"; binding.pry
  end
end
