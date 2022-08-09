require './lib/enigma.rb'

message_folder = ARGV[0]
encrypted_folder = ARGV[1]

def encrypt(message_folder, encrypted_folder)
  enigma = Enigma.new
  file = File.open(message_folder)
  read_message = file.read.downcase.chomp
  e_msg = enigma.encrypt(read_message)
  e_file = File.open(encrypted_folder, "w")
  updated_e_file = e_file.write(e_msg[:encryption])
  close_file = e_file.close
  puts "Created 'encrypted.txt' with the key #{e_msg[:key]} and date #{e_msg[:date]}"
end

encrypt(message_folder, encrypted_folder)
