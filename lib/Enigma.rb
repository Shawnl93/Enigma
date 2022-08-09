class Enigma

  attr_reader :name, :key

  def initialize(name)
    @name = name
    @key = Key.new
  end

  def encrypt(message, key, date)
    @key.gen_key
    @key.date_encrypt(date)
    code = @key.ecode
    testing = @key.encrypting(message, code)


    hash = {
      :encryption => testing,
      :key => key,
      :date => date
    }
  end

  def decrypt()
    @key.gen_key
    @key.date_encrypt(date)
    code = @key.ecode
    testing = @key.decrypting(message, code)


    hash = {
      :encryption => testing,
      :key => key,
      :date => date
    }
    
  end
end
