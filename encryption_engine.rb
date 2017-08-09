class EncryptionEngine

  def encrypt(string, key)
    message_splitted = string.downcase.split("")
    message_splitted.map! do |letter|
      if letter.ord + key > "z".ord
        new_number = letter.ord + key - 1 - "z".ord + "a".ord
      else
        new_number = letter.ord + key
      end
      new_number = 32 if new_number == 45
      new_number.chr
    end
    res = message_splitted.join
    res.split(" ").map {|word| word.capitalize}.join(" ")
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
