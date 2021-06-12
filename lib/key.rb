class Key
  attr_reader :key

  def initialize(key)
    @key = []
  end

  def generate_from_input(input)
#will need to take 5-digit input and convert to array.
  input.to_a
end

  def create_keys
    sample_key = [1, 2, 3, 4, 5]
    sample_key.each_cons(2) do |number|
      p number
    end
  end
end
