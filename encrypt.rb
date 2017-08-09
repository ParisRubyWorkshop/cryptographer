def encrypted_message(message, key)
  message_splitted = message.split("")
  message_splitted.map! do |letter|
    new_number = letter.ord + key
    new_number.chr
  end
  message_splitted.join
end




key = 13
message = "This is my secret"

# do your encryption here

puts encrypted_message(message, key)