class EncryptionEngine

  def encrypt(string, key)
    message_splitted = string.downcase.split("")
    en = encryptor(message_splitted, key)
    final_string_with_capitals(en, string)
  end

  def decrypt(string, key)
    message_splitted = string.split("")
    de = decryptor(message_splitted, key)
    final_string_with_capitals(de, string)
  end

  private

  def letter_capitalized?(letter)
    letter == letter.upcase
  end

  def string_capitalized?(string)
    string.split("").map { |letter| letter_capitalized?(letter) }
  end

  def encryptor(array, key)
    array.map! do |letter|
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
    array.map! do |letter|
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
