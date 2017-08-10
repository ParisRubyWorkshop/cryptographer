class EncryptionEngine

  def encrypt(string, key)
    characters = string.downcase.split("")
    encrypted_characters = encryptor(characters, key)
    final_string_with_capitals(encrypted_characters, string)
  end

  def decrypt(string, key)
    characters = string.downcase.split("")
    decrypted_characters = decryptor(characters, key)
    final_string_with_capitals(decrypted_characters, string)
  end

  private

  def letter_capitalized?(letter)
    letter == letter.upcase
  end

  def string_capitalized?(string)
    string.split("").map { |letter| letter_capitalized?(letter) }
  end

  def encryptor(array, key)
    array.map do |letter|
      if letter.ord + key > "z".ord
        new_number = letter.ord + key - "z".ord + "a".ord - 1
      else
        new_number = letter.ord + key
      end
      new_number = 32 if new_number == 45
      new_number.chr
    end
  end

  def decryptor(array, key)
    array.map do |letter|
      if letter.ord - key < "a".ord
        new_number = letter.ord - key + "z".ord - "a".ord + 1
      else
        new_number = letter.ord - key
      end
      new_number = 32 if new_number == 45
      new_number.chr
    end
  end

  def final_string_with_capitals(array, string)
    result = []
    array.each_with_index do |letter, index|
      letter.upcase! if string_capitalized?(string)[index]
      result << letter
    end
    result.join
  end
end


p EncryptionEngine.new.encrypt("This is a mega secret", 13)
p EncryptionEngine.new.decrypt("Guvf vf n zrtn frperg", 13)