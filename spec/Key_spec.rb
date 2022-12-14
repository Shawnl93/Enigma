require './lib/key'

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

  it "has offsets" do
    expect(@key.date_encrypt("040895")).to be_a(Array)
  end

  it "can encrypt message" do
    @key.gen_key("02715")
    @key.date_encrypt("040895")
    expect(@key.ecode).to be_a(Array)
  end

  it "can mix up messages" do
    @key.gen_key("02715")
    @key.date_encrypt("040895")
    key = @key.ecode
    expect(@key.encrypting("HELLO WORLD", key)).to eq("keder ohulw")
  end

  it "test" do
    expect(@key.alphabet_index("h")).to eq(7)
  end

  it "can figure out message" do
    @key.gen_key("02715")
    @key.date_encrypt("040895")
    key = @key.ecode
    expect(@key.decrypting("keder ohulw", key)).to eq("hello world")

  end

  it "can tell todays date" do
    expect(@key.date).to eq("090822")
  end

  it "text" do
  expect(@key.rng).to be_a(String)
  end
end
