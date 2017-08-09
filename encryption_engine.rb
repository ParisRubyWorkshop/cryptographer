class EncryptionEngine

  def encrypt(string, key)
    message_splitted = string.split("")
    message_splitted.map! do |letter|
      new_number = letter.ord + key
      new_number.chr
    end
    message_splitted.join
  end

  def decrypt(string, key)
    # Your code here
    message_splitted = string.split("")
    message_splitted.map! do |letter|
      new_number = letter.ord - key
      new_number.chr
    end
    message_splitted.join
  end
end
