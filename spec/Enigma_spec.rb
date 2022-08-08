require 'date'
require './lib/enigma'

describe Enigma do
  before :each do
    @enigma = Enigma.new("Cypher")
  end

  it "has a name" do
    expect(@enigma.name).to eq("Cypher")
  end

  it "can ecrypt" do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({})
  end
end
