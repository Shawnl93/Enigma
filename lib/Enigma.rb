require './lib/key'
require 'date'

class Enigma

  attr_reader :key

  def initialize
    @key = Key.new
  end

  def encrypt(message, key = @key.rng, date = @key.date)
    @key.gen_key(key)
    @key.date_encrypt(date)
    code = @key.ecode
    testing = @key.encrypting(message, code)


    hash = {
      :encryption => testing,
      :key => key,
      :date => date
    }
  end

  def decrypt(message, key = @key.rng, date = @key.date)
    @key.gen_key(key)
    @key.date_encrypt(date)
    code = @key.ecode
    testing = @key.decrypting(message, code)


    hash = {
      :decryption => testing,
      :key => key,
      :date => date
    }
  end

end
