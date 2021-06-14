#could call this shift to possibly better reflect what it will end up doing?

class Key
  # attr_reader :key

  def initialize#(key)
    # @key = key
  end

  #helper method for create_keys
  def generate_key
    number_set = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 0, 0, 0, 0, 0]
    @key_as_array = number_set.sample(5)
    @key_as_array.join("").to_i
  end

  def create_keys
    generate_key
    final_keys = []
    @key_as_array.each_cons(2) do |number_pair|
      final_keys << number_pair
    end
    final_keys
  end

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
  # def user_generate(input)
  #   #will need to take 5-digit input and convert to array.
  # input.split("")

  def offsets_as_strings
   last_four_array.each_slice(1).to_a
  end

  def create_offsets
    offsets_as_strings.map do |subarray|
      subarray.map do |element|
        element.to_i
      end
    end
  end

end
