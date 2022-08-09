class Key

  attr_reader :alphabet, :a, :b, :c, :d

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @a = []
    @b = []
    @c = []
    @d = []
  end

  def gen_key
    created_key = "02715"
    # rand(0..99999).to_s.rjust(5,'0')
     if created_key.slice(0..1)
       @a << created_key.slice(0..1)
      end
     if created_key.slice(1..2)
      @b << created_key.slice(1..2)
      end
     if created_key.slice(2..3)
       @c << created_key.slice(2..3)
      end
     if created_key.slice(3..4)
       @d << created_key.slice(3..4)
      end
  end

  def date_encrypt(ddmmyy)
    date_squared = ddmmyy.to_i * ddmmyy.to_i
    last_four = date_squared.to_s.slice(-4..-1)
    if last_four.slice(0)
      @a << last_four.slice(0)
    end
    if last_four.slice(1)
      @b << last_four.slice(1)
    end
    if last_four.slice(2)
      @c << last_four.slice(2)
    end
    if last_four.slice(3)
      @d << last_four.slice(3)
    end
  end

  def ecode
    @a  =  @a[0].to_i + @a[1].to_i
    @b  =  @b[0].to_i + @b[1].to_i
    @c  =  @c[0].to_i + @c[1].to_i
    @d  =  @d[0].to_i + @d[1].to_i
    [@a, @b, @c, @d]
  end

  def encrypting(message, key)
    mixed_word = ""
    position = 0
    split_word = message.downcase.split("")
    split_word.map do |letter|
      position += 1; position = 1 if position > 4
      char = @alphabet.rotate(alphabet_index(letter)).rotate(shift_a(key)).first if position == 1
      char = @alphabet.rotate(alphabet_index(letter)).rotate(shift_b(key)).first if position == 2
      char = @alphabet.rotate(alphabet_index(letter)).rotate(shift_c(key)).first if position == 3
      char = @alphabet.rotate(alphabet_index(letter)).rotate(shift_d(key)).first if position == 4
      mixed_word << char.downcase
    end
    mixed_word
  end

  def decrypting(message, key)
    mixed_word = ""
    position = 0
    split_word = message.downcase.split("")
    split_word.map do |letter|
      position += 1; position = 1 if position > 4
      char = @alphabet.rotate(alphabet_index(letter)).rotate(-(shift_a(key))).first if position == 1
      char = @alphabet.rotate(alphabet_index(letter)).rotate(-(shift_b(key))).first if position == 2
      char = @alphabet.rotate(alphabet_index(letter)).rotate(-(shift_c(key))).first if position == 3
      char = @alphabet.rotate(alphabet_index(letter)).rotate(-(shift_d(key))).first if position == 4
      mixed_word << char.downcase
    end
    mixed_word
  end

  def alphabet_index(letter)
    @alphabet.index(letter)
  end

  def shift_a(key)
    key[0]
  end

  def shift_b(key)
    key[1]
  end

  def shift_c(key)
    key[2]
  end

  def shift_d(key)
    key[3]
  end

  def date
    Date.today.strftime("%D")
  end

end
