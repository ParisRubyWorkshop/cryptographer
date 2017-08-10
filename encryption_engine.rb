class EncryptionEngine

  def encrypt(string, key)
    message_splitted = string.split("")
    result = message_splitted.map do |letter|
      new_number = letter.ord + key
      # if rotation of ascii number is greater than (Z|z).ord : -26 (back to (A|a))
      new_number -= 26 if letter.ord + key > max_AZ(letter)
      # keep space and punctuation unchanged
      new_number = letter.ord if /\W+/.match(letter)
      new_number.chr
    end
    result.join
  end

  # max_AZ refer to "Z".ord if letter is capitalized, "z" if not
  def max_AZ(letter)
    if letter.ord >= 65 && letter.ord <= 90
      return 90
    else
      return 122
    end
  end

  def decrypt(string, key)
    message_splitted = string.split("")
    result = message_splitted.map do |letter|
      new_number = letter.ord - key
      new_number += 26 if letter.ord - key < max_AZ(letter) - 26
      new_number = letter.ord if /\W+/.match(letter)
      new_number.chr
    end
    result.join
  end

end
