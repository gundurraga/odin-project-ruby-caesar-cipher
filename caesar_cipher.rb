def letter?(char)
  ('a'..'z').include?(char.downcase)
end

def uppercase?(char)
  char == char.upcase && char != char.downcase
end

def shift_number(number)
  number % 26
end

def caesar_cipher(message, number)
  shift = shift_number(number)
  message.chars.map do |char|
    if letter?(char)

      base = uppercase?(char) ? 'A'.ord : 'a'.ord
      ((char.ord - base + shift) % 26 + base).chr
    else
      char
    end
  end.join
end

print 'Enter the message you want to encrypt: '
user_message = gets.chomp

print 'Enter the shift number: '
user_shift = gets.chomp.to_i

encrypted_message = caesar_cipher(user_message, user_shift)
puts "Your message: #{user_message} was encrypted with the Caesar cipher using #{user_shift} as shift number resulting in the encrypted message: #{encrypted_message}"
