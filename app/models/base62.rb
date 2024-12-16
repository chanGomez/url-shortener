class Base62
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first  if number.zero? || number.nil?
    result = ""

    while number > 0 do
    index = number % BASE
    char = ALPHABET[index]
    result.prepend char
    number = number / BASE
    end

    result
  end

  def self.decode(string)
      raise ArgumentError, "Input must be a string" unless string.is_a?(String)
    number = 0

    string.reverse.each_char.with_index do |char, index|
      power = BASE**index
      index = ALPHABET.index(char)
      number += index * power
    end

    number
  end
end