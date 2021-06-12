class Key
  # attr_reader :key

  def initialize#(key)
    # @key = key
  end

  def generate_key
    character_set = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    generated_key = character_set.sample(5)
      generated_key.join("").to_i
  end

  def create_keys
    sample_key.each_cons(2) do |number|
      p number
    end
  end

  # def user_generate(input)
  #   #will need to take 5-digit input and convert to array.
  # input.split("")
  # end
end
