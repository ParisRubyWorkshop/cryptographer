# def encrypted_message(message, key)
#   message_splitted = message.split("")
#   message_splitted.map! do |letter|
#     new_number = letter.ord + key
#     new_number.chr
#   end
#   message_splitted.join
# end

require_relative 'encryption_engine'

key = 13
message = "This is my secret"

# do your encryption here

# puts encrypted_message(message, key)

engine = EncryptionEngine.new
output = engine.encrypt(message, key)
puts output  # outputs "Zl Zrffntr"
output2 = engine.decrypt(output, key)
puts output2 # outputs "My Message"
