require './lib/Key'

describe Key do
  before :each do
    @key = Key.new
  end

  it "exists" do
    expect(@key).to be_instance_of(Key)
  end

  xit "has keys" do
    expect(@key.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  xit "it generate 5 digit numbers " do
    expect(@key.generate).to eq([])
  end

  xit "has offsets" do
    expect(@key.squared("040895")).to eq([1672401025])
  end

  xit "can encrypt message" do
    @key.generate
    @key.squared("040895")
    expect(@key.ecode).to eq("")
  end

  it "can figure out messages" do
    @key.generate
    @key.squared("040895")
    key = @key.ecode
    expect(@key.secret("hello world", key)).to eq("keder ohulw")
  end

  it "test" do
    expect(@key.alphabet_index("h")).to eq(7)
  end
end
