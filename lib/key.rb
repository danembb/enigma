#could call this shift to possibly better reflect what it will end up doing?

class Key

  def initialize
  end

#JustKeyThings~*~*
  def generate_key
    number_set = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 0, 0, 0, 0, 0]
    @key_as_array = number_set.sample(5)
    @key_as_array.join("").to_i
  end

  def key_pairs
    generate_key
    final_key_pairs = []
    @key_as_array.each_cons(2) do |number_pair|
      final_key_pairs << number_pair
    end
    final_key_pairs
  end

  def keys
    keys_as_strings = []
    key_pairs.map do |pair|
      keys_as_strings.push(pair.join)
    end
    keys_as_integers = keys_as_strings.map do |element|
      element.to_i
    end
    keys_as_integers
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

  # def merp
  #   keys_and_offsets = [keys, offsets]
  #   keys_and_offsets.transpose
  # end
end
