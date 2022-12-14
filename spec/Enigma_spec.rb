require 'date'
require './lib/enigma'
require './lib/key'

describe Enigma do
  before :each do
    @enigma = Enigma.new
    @key = Key.new
  end

  it "can encrypt" do

    expected_hash = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
  }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected_hash)
  end

  it "can decrypt" do
    expected_hash = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
  }
  expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected_hash)
  end

  it "encrypt a message with a key (uses today's date)" do
    expected_hash = {
      encryption: "okjdvfugyrb",
      key: "02715",
      date: @key.date
    }
    expect(@enigma.encrypt("hello world", "02715", @key.date)).to eq(expected_hash)
  end

  it "decrypt a message with a key (uses today's date)" do
    expected_hash = {
      decryption: "hello world",
      key: "02715",
      date: @key.date
    }
    expect(@enigma.decrypt("okjdvfugyrb", "02715", @key.date)).to eq(expected_hash)
  end

  xit "encrypt a message (generates random key and uses today's date)" do
    expected_hash = {
      encrypt: "okjdvfugyrb",
      key: rkey = @key.rng,
      date: @key.date
    }
    expect(@enigma.encrypt("hello world", rkey, @key.date)).to eq(expected_hash)

  end
end
