class Key

  attr_reader :alphabet, :a, :b, :c, :d

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @a = []
    @b = []
    @c = []
    @d = []
  end

  def generate
    rand(0..99999).to_s.rjust(5,'0')
  end

  def squared(date)
  date_squared = []
 date_squared << date.to_i * date.to_i
  end
end
