class Enigma

  attr_reader :name

  def initialize(name)
    @name = name
    @key = Key.new
  end

  def encrypt(message, key, date)
    require "pry"; binding.pry
  end
end
