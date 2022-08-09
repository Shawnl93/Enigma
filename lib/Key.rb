class Key

  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def generate
    rand(0..99999).to_s.rjust(5,'0')
  end
end
