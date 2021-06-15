require './lib/shift'
class Enigma
  attr_reader :shift,
              :character_set,
              :key,
              :date

  def initialize
    @shift = Shift.new
    @character_set = ("a".."z").to_a << " "
    @key = shift.keys
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

  def encrypt(message, key = @key, date = shift.return_date)
    array = message.chars
    encrypted_message = array.each_with_index do |element, index|
      shift = find_shift(index)
      require "pry"; binding.pry
      change_elements(element, shift)
    end.join
    encrypt_hash = {encryption: encrypted_message, key: key, date: date}
  end

  def change_elements(front_element, shift)
    the_biz = @character_set.index(front_element)
    rotated_array = @character_set.rotate(shift)
    rotated_array[the_biz]
  end
end
