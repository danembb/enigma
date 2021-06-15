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

#JustOffsetThings~*~*
  def return_date
    Date.today.strftime("%d%m%y")
  end
end
