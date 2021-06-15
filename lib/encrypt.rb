require "./spec/spec_helper"

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

encrypted_text = enigma.encrypt(incoming_text, "82648", "240818")

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text[:encryption])

writer.close

puts "Created 'encrypted.txt' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
