require './lib/Key'

describe Key do
  before :each do
    @Key = Key.new
  end

  it "exists" do
    expect(@Key).to be_instance_of(Key)
  end

  it "has keys" do
    expect(@Key.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "it generate 5 digit numbers " do
    expect(@Key.generate).to eq("")
  end
end
