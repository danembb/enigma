require './lib/shift'
class Enigma
  attr_reader :shift,
              :character_set,
              :key,
              :date

  def initialize
    @shift = Shift.new
    @character_set = ("a".."z").to_a << " "
    @key = shift.generate_key
    @date = shift.return_date
  end

  def find_shift(index)
    if index % 4 == 0
      shift.shifts[0]
    elsif index % 4 == 1
      shift.shifts[1]
    elsif index % 4 == 2
      shift.shifts[2]
    elsif index % 4 == 3
      shift.shifts[3]
    end
  end

  def encrypt(message, key = @key, date = @date)
    encrypt_hash = {encryption: message, key: key, date: date}
    encrypted_message = []
    array = message.chars
    array.each_with_index do |element, index|
      shift = find_shift(index)
      new_character = change_elements(element, shift)
      encrypted_message.push(new_character)
    end
    encrypt_hash[:encryption] = encrypted_message.join
    encrypt_hash
  end

  def change_elements(front_element, shift)
    the_biz = @character_set.index(front_element)
    rotated_array = @character_set.rotate(shift)
    rotated_array[the_biz]
  end
end
