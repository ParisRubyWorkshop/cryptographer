class EncryptionEngine

  def encrypt(string, key)
    array_capitals = string.split("").map { |letter| capitalized?(letter) }
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

    result = []
    message_splitted.each_with_index do |letter, index|
      letter.upcase! if array_capitals[index]
      result << letter
    end
    result.join
  end

  def capitalized?(string)
    string.split("").map { |letter| letter == letter.upcase }
  end

  def capitalize_array(array)
    result = []
    array.each_with_index do |letter, index|
      letter.upcase! if capitalized?[index]
      result << letter
    end
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
