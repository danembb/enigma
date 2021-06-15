require './lib/shift'
class Enigma

  attr_reader :shift,
              :character_set,
              :key,
              :date

  def initialize
    @shift = shift
    @character_set = ("a".."z").to_a << " "
    @shift2 = Shift.new
    @key = @shift2.generate_key
    @date = @shift2.return_date
  end

  #keys
  def keys(key)
    split = key.split(//)
    split_after = split.map do |element|
      element.to_i
    end
    final_key = []
    split_after.each_cons(2) do |number|
      final_key << number
    end
    final_key.map do |key|
      key.join.to_i
    end
  end

  #offsets
  def date_squared(date)
    (date.to_i ** 2)
  end

  def last_four_array(date)
    squared_as_array = date_squared(date).to_s.split("")
    squared_as_array.last(4)
  end

  def offsets_as_strings(date)
   last_four_array(date).each_slice(1).to_a
  end

  def offsets(date)
    offsets_as_strings(date).map do |subarray|
      subarray.map do |element|
        element.to_i
      end
    end.flatten
  end

  def shifts(key, date)
    keys(key)
    date_squared(date)
    last_four_array(date)
    offsets_as_strings(date)
    offsets(date)

    a_shift = keys(key)[0] + offsets(date)[0]
    b_shift = keys(key)[1] + offsets(date)[1]
    c_shift = keys(key)[2] + offsets(date)[2]
    d_shift = keys(key)[3] + offsets(date)[3]
    @shifts = [a_shift, b_shift, c_shift, d_shift]
  end

  #enigma helper methods
  def find_shift(index)
    if index % 4 == 0
      @shifts[0]
    elsif index % 4 == 1
      @shifts[1]
    elsif index % 4 == 2
      @shifts[2]
    elsif index % 4 == 3
      @shifts[3]
    end
  end

  #enigma #encrypt
  def encrypt(message, key = @key, date = @date)
    shifts(key, date)
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
    #change the biz
    the_biz = @character_set.index(front_element)
    rotated_array = @character_set.rotate(shift)
    rotated_array[the_biz]
  end

  def decrypt(message, key = @key, date = @date)
    shifts(key, date)
    decrypt_hash = {decryption: message, key: key, date: date}
    decrypted_message = []
    array = message.chars
    array.each_with_index do |element, index|
      shift = find_shift(index)
      new_character = change_elements(element, shift)
      decrypted_message.push(new_character)
    end
    decrypt_hash[:decryption] = decrypted_message.join
    decrypt_hash
  end
end
