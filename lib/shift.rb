class Shift
  attr_reader :key

  def initialize
    @key = generate_key
  end

#JustKeyThings~*~*
  def generate_key
    number_set = [0, 1, 2, 3, 4, 5, 6, 7 ,8, 9] * 5
    key_as_array = number_set.sample(5)
    key_as_array.join("").rjust(5, "0")
  end

  def keys
    split = @key.split(//)
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

#JustOffsetThings~*~*
  def return_date
    Date.today.strftime("%d%m%y")
  end

  def date_squared
    (return_date.to_i ** 2)
  end

  def last_four_array
    squared_as_array = date_squared.to_s.split("")
    squared_as_array.last(4)
  end

  def offsets_as_strings
   last_four_array.each_slice(1).to_a
  end

  def offsets
    offsets_as_strings.map do |subarray|
      subarray.map do |element|
        element.to_i
      end
    end.flatten
  end

  def shifts
    a_shift = keys[0] + offsets[0]
    b_shift = keys[1] + offsets[1]
    c_shift = keys[2] + offsets[2]
    d_shift = keys[3] + offsets[3]
    [a_shift, b_shift, c_shift, d_shift]
  end
end
