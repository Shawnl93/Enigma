require 'date'
require './lib/enigma'
require './lib/Key'

describe Enigma do
  before :each do
    @enigma = Enigma.new("Cypher")
  end

  it "has a name" do
    expect(@enigma.name).to eq("Cypher")
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
end
