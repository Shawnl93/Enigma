require './lib/enigma.rb'

encrypted_folder = ARGV[0]
decrypted_folder = ARGV[1]

def decrypt(encrypted_folder, decrypted_folder ,decrypt_key = ARGV[2], decrypt_date = ARGV[3])
  enigma = Enigma.new
  file = File.open(encrypted_folder)
  read_message = file.read.downcase.chomp
  e_msg = enigma.decrypt(read_message, decrypt_key, decrypt_date)
  e_file = File.open(decrypted_folder, "w")
  updated_e_file = e_file.write(e_msg[:decryption])
  close_file = e_file.close
  puts "Created 'decrypted.txt' with the key #{e_msg[:key]} and date #{e_msg[:date]}"
end

decrypt(encrypted_folder, decrypted_folder)
