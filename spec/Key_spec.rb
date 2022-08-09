require './lib/Key'

describe Key do
  before :each do
    @key = Key.new
  end

  it "exists" do
    expect(@key).to be_instance_of(Key)
  end

  it "has keys" do
    expect(@key.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "it generate 5 digit numbers " do
    expect(@key.generate).to be_a(String)
  end

  it "has offsets" do
    expect(@key.squared("040895")).to eq([1672401025])
  end
end
