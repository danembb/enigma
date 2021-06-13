require "./lib/message"
require "./lib/enigma"

message = Message.new
#this will greet the user, then ask them if they want to type in a 5 letter sequence to decode or to generate a random
#sequence. After, it will show them the sequence (either way), then encode it.
puts message.welcome
puts message.welcome_query
#encryption_flow(gets.chomp)
